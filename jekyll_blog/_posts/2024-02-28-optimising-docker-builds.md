---
layout: post
title: "Optimising docker builds"
date: 2024-02-28
published_on: 28th February, 2024
author: Gagandeep Singh
image: "/assets/images/2024-02-28-dockers.jpg"
categories: Docker Optimization Dockerfile
excerpt: A detailed post on optimising docker build time and image size for any application based on my experience in optimising the same twice for one of our mid size application
---

Photo by <a href="https://unsplash.com/@carrier_lost?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Ian Taylor</a> on <a href="https://unsplash.com/photos/blue-and-red-cargo-ship-on-sea-during-daytime-jOqJbvo1P9g?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

## Background

This month I worked on optimising docker build for an app. But before delving into the specifics of my optimisation efforts, let me provide you with a overview of the application:

1. It's a medium size, fullstack Rails application (400+ models)

2. It has 300+ dependencies (a.k.a ruby gems).

3. It contains rails views (activeadmin majorly) and assets.

4. It uses react on the frontend and uses webpacker to transpile those into JS.

5. We had two dockerfiles - one for the web app and one for background job processor ([sidekiq](https://github.com/sidekiq/sidekiq), similar to [celary](https://docs.celeryq.dev/en/stable/getting-started/introduction.html), [jobrunr](https://github.com/jobrunr/jobrunr), etc). These could be combined now to some extent but were different due to different base images initially.


We can think of optimising a docker image in two ways:

**☑** Optimising build time.
**☑** Optimising image size.

I had to tick both the boxes and optimise as much as possible in the next few days. The first and very obvious step was to understand the steps in the `Dockerfile` and read some good blogs on how people have been doing it for their app. I had already been reading this [excellent book](https://diamol.net/) earlier this month, that helped me build strong fundamentals around Docker as a technology. The first part of this book talks about the very basic things (needed to build and optimise images), while rest of the parts talk about operating Docker. While there were some excellent case studies talking specifically about optimising for Rails apps, most of the techniques were already applied back in 2022 when I picked the optimisation activity for the first time. To make sure that you get the most out of this post, I'll share the older optimisations also.

## The basics

1. **Understanding layering** - A `Dockerfile` typically starts with a `FROM` instruction that points to a base image specific to your language/framework. Beyond this, there are many more instructions like `ARG`, `ENV`, `RUN`, `COPY`, `ADD`. It generally ends with `ENTRYPOINT` & `CMD` instructions (unless we're passing `CMD` from outside). The instructions that actually create heavy layers are `RUN`, `COPY` & `ADD` because we run some commands or copy some files/directories from the host machine to the docker image using these commands. From an optimisation perspective, "least changing layers should remain on top and most changing layers should be at the bottom". This is because when you run the `docker build` command multiple times and if you haven't cleared the build caches, the unchanged layers do not get computed again and subsequent builds are faster. This is the single most useful concept I used multiple times to get most out of caching.

2. **Understanding base images** \- Our app used ruby 2.5.9 so we used the [official ruby 2.5.9 image](https://hub.docker.com/layers/library/ruby/2.5.9/images/sha256-0ed9d1839df4d5c08c98a0a7315519694c5da80b0885d6a5b96d5d5bb564d5a5?context=explore) as our base image to start with. Digging deep on the tags, we found that there are multiple tags for the same version also (like `slim`, `alpine`, `buster`, etc). Some of these have a different unix flavour as the base OS, while some of these have less system packages installed. For example, `alpine` is the lightest image but it uses `alpine linux` as the base operating system. We did not move to it as we have always ran our app on `debian` unix (`ubuntu` mostly). In the end we settled for `slim` version of the image that uses debian as the base OS but doesn't bloat the image with a lot of pre-installed packages. Someone [opened an issue](https://github.com/rails/rails/issues/46855) on Rails official repo that has a detailed discussion on how these images are different and what native packages we generally need to run our apps.

3. **Understanding docker stages** - A `Dockerfile` can contain multiple `FROM` instructions where each of them starts another "stage". This small yet powerful concept allows you to optimize your build size by copying only required things from one stage to another stage. We'll discuss it in detail below.

4. **Understanding caching** \- Docker allows caching in multiple ways. As mentioned in the first point, docker caches all the layers so that unchanged layers are not rebuilt on subsequent runs. Docker also allows caching steps of some intermediate layers so that those are not computed again from scratch. This can be done using cache mounts. Docker's [official explanation](https://docs.docker.com/build/guide/mounts/#add-a-cache-mount) of cache mounts is excellent. Another small optimisation on layering can be done using [bind mounts](https://docs.docker.com/build/guide/mounts/#add-bind-mounts) where you can skip a `COPY` instruction incase you need files to just run an intermediate step.


I hope the above helped in building some ground. Sharing the actual details below.

## Our final Dockerfiles

I'm pasting three Dockerfiles here as a reference. We'll go through each line of all the three files to deeply understand why we did each change. While these are related to a Ruby on Rails fullstack application, I'll explain this in a general context and use examples from multiple languages.

**Base Dockerfile** - We built our own ruby-2.5.9 image on the top of the official image. The reason for doing this is - although docker's build cache optimises a lot of steps, our build machine (a jenkins slave) periodically runs `docker system prune` to clear old images and save disk space. And that is done because a lot of apps build their image on the build machine, eating up all the disk space. This is how the base image looks like:


```dockerfile
FROM ruby:2.5.9-slim
RUN apt update && apt install -y curl  \
    && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt install -y gcc g++ make git nodejs \
    && apt autoremove -y && apt clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log \
    && gem install bundler:2.3.26 --no-document \
    && bundle config --local without "development test"

RUN --mount=type=bind,source=Gemfile,target=Gemfile \
    --mount=type=bind,source=Gemfile.lock,target=Gemfile.lock \
    bundle install --jobs `getconf _NPROCESSORS_ONLN`
```

Sidekiq dockerfile - Sidekiq is our background job processor. This file uses the above image in the `FROM` instruction, installs more dependencies and copies code


```dockerfile
ARG BASE_IMAGE
FROM $BASE_IMAGE
WORKDIR /home/app/my_app
RUN --mount=type=bind,source=Gemfile,target=Gemfile \
    --mount=type=bind,source=Gemfile.lock,target=Gemfile.lock \
    --mount=type=bind,source=gems,target=gems \
    bundle install --jobs `getconf _NPROCESSORS_ONLN`

COPY . .
ENTRYPOINT ["/home/app/my_app/entrypoint.sh"]
```

WebApp dockerfile - This file uses the sidekiq dockerfile as the base image and adds frontend assets on the top of it. This one is a multistage build, where we do building assets in one stage and copy only the required artifacts to the final stage. This is done to ensure that no bloat exists in the final stage.


```dockerfile
ARG BASE_IMAGE
FROM $BASE_IMAGE AS frontend-pipeline
RUN npm install -g yarn
RUN yarn install --production=true
RUN --mount=type=cache,target=/home/app/my_app/tmp/ \
  --mount=type=bind,source=config/database.yml.example,target=config/database.yml \
  bundle exec rake assets:precompile DB_ADAPTER=nulldb RAILS_ENV=production NODE_ENV=production NODE_OPTIONS="--max-old-space-size=28672"

FROM $BASE_IMAGE
EXPOSE 3000
CMD <whatever>
COPY --from=frontend-pipeline /home/app/my_app/public /home/app/my_app/public
```

## Digging deep

1. **Why we switched to** `slim` **image of ruby 2.5.9 and how it impacted us?**

    * We were sure that we don't need those 500+ system packages that are pre-installed inside 2.5.9 image. Additionally, on my macos, if I pull both the images (slim and non-slim), there is a huge difference of 82% (140MB vs 790MB).

    * We knew what specific system packages we needed. Figuring this out is not hard. If your docker image is building successfully and all major features are working, you can conclude that easily. Having working experience on this repo of more than 5 years, I exactly knew what native dependencies we need here so we were able to move to slim image.

    * It led to a build size reduction of about 450MB on AWS ECR (where we host the images).

2. **Why we built our own base image?**

    * As explained above, our build machine purges docker caches regularly because of which the ruby docker image is pulled again and all the system packages are install again. This wasted roughly 3-4 minutes. Also, pulling the image from ECR should be faster than pulling from dockerhub (as build machine is on AWS).

    * If you check carefully, we install gems from Gemfiles in first two Dockerfiles. They point to different Gemfiles. In the first dockerfile, we use a Gemfile that has only those gems which are installed with native dependencies (and hence take time). This was done to ensure build time reduction. We save roughly a minute here. This technique can be used in all frameworks; if your package manager has some dependencies that hardly change and take time to install, move them to the base image. You might want to avoid this if you use one base image for multiple dependencies.

    * We have some tooling for configuration management that is built using golang base image. That is also present in the base image. When we were not having base `Dockerfile`, that took about a minute to build in the sidekiq `Dockerfile`.
        **Note**: I've not mentioned those lines in the Dockerfile as that tooling is proprietary. In real world, the first dockerfile is also multistage :)

3. **How did we make dependency installation fast?**

    * All languages have some dependency manager: `bundler` for Ruby, `pip` for Python, `maven/gradle` for Java and so on. Modern computers are multi-core and most of the new tools have ways to utilise multiple cores for tasks that can be parallelized. We used `--jobs` argument to parallelize the installation for ruby's bundler. Earlier we had hardcoded `4` as the number of parallel jobs. But because our build machine is large now (it can be small in future), it makes sense to get this value dynamically. Hence you see this `getconf _NPROCESSORS_ONLN` in the `bundle install` step (this command works well in both unix and mac).

    * We installed some gems like `nokogiri`, `bcrypt`, `oj`, `pg` in the base image because they're built with native dependencies and take time. Also, we don't upgrade them regularly and hence won't need to revisit them in the base image. Due to this reason, there's a special Gemfile for base image (different from the app's Gemfile).

4. **Why did we combine many commands in a single RUN instruction?**

    * Because each RUN command creates a new layer and we want to minimize the number of layers. Most importantly, if we create some files in one layer and delete them in other layer, it won't reduce the image size as docker would maintain both of these layers (even the one that added the file). In brief, if there's a RUN command that only deletes something, it might not bring a change in size of your image. As a clever trick, we're deleting some logs related to package installation and other system logs (`rm -rf /var/cache/apt/archives/* && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && truncate -s 0 /var/log/*log` ) inside the same RUN instruction so that those are never inserted in the docker's layer.

5. **Why are we not copying the** `Gemfile`**,** `Gemfile.lock` **in the image and then running the** `bundle install` **command?**

    * We don't need these files so we won't copy them inside the docker's layer. Rather, we're using docker's bind mounts to bind these files temporarily for the RUN instruction. You can use the same technique in other frameworks as well. For example, for `npm` based projects, you can bind `yarn.lock` and `package.json` before running the `yarn install` command (or mount `requirements.txt` before running `pip` for a python project, and so on).

6. **In the second Dockerfile, why we add codebase later and just bind Gemfiles first?**

    * Earlier, our instructions looked like this:

    * ```dockerfile
        COPY Gemfile .
        COPY Gemfile.lock .
        RUN bundle install

        WORKDIR /home/app/my-app
        COPY . . # copies entire source code
        ```

        Now, we're using the bind mount. But the question is same - why would we first copy files that define dependencies and copy rest of the code later. Reason is simple - There are more chances that something else in entire codebase will change than the dependencies. So if we copy everything and them run the dependency manager (bundler/maven/pip/yarn), then the cache of that layer will always be rebuilt. Whereas, if we copy package files first, there are more chances that the cached layer will be used.

7. **Why our files don't have a CMD defined?**

    * We have multiple entry points that can run on the top of these docker images (eg. [puma](https://github.com/puma/puma/), [anycable](https://github.com/anycable/anycable), [sidekiq](https://github.com/sidekiq/sidekiq)). So we prefer to pass CMD from outside. There are multiple ways to do so based on the way you're running the container. For example, if you're running the image using plain `docker run` command then just write the command to be run in CMD after this (Eg. `docker run -it ruby:2.5.9-slim irb)` . Similarly, you can provide CMD argument through docker-compose, docker-swarm or through helm charts (for kubernetes).

8. **There are many special things happening in asset precompile step. I'll explain them one by one**

    * We mount a sample `database.yml` file (dummy database configuration file, doesn't contain any credentials) using bind mounts because `rake` commands sets up entire rails environment and that is needed.

    * To make sure database is not connected, we also use a [special library](https://github.com/nulldb/nulldb) during precompile step.

    * We use docker's cache mounts (`--mount=type=cache`) to cache the results of this step so that next time only changed steps get recomputed.

    * We supply specific `NODE_OPTIONS` so that build machine's memory can be utilized to compile as fast as possible.

    * Assets are compiled in an intermediate stage and only required artifacts are copied to the final layer.


## Results

The results in our case were outstanding, specially in terms of image size. Image time did improve when I did optimizations in 2022, but this time there was no drastic increase. Time for numbers 🎉

1. **Build size**: Earlier we were maintaining two docker images - 2.4G and 1.5G. So on any node in the kubernetes nodepool, if both of our images are needed, we were required to download ~ 4G of files. Only common thing among these two was the ruby base image. So probably we were downloading ~ 3.5G if we take that out. After optimization, the image size was 1.1G and 1.5G. More importantly, this 1.1G was common as one image was used in second image. So technically, we'll be downloading only 1.5G on any node where we need both the images. That's an improvement of **over 57%.** And this difference is only of our current optimization. If we compare it back to 2022, the difference was even large.

2. **Build time**: The current build time is 12-15min. A month ago it was around 14-18min. Back in 2022, it was about 30min. So from that time it has been a significant improvement but comparing from last month, the build time has not improved much. A major time goes into transpiling react code to JS, and pushing images to ECR.


## Impact

1. **Build size**: At LocoNav, we have staging, preprod and production environments. We have our oldest production environment (on AWS) and few small production deployments in other countries where we operate on some other cloud providers. On AWS, we deploy daily but in other clusters we deploy weekly or fortnightly. Because we're copying docker images from AWS ECR to other cloud providers, reduction of &gt;50% would mean faster image pulls and faster deployments. In the long run, because we're pushing lesser GBs from the build machine to ECR, and from ECR to EKS (and even outside AWS), it would lead to lesser S3 cost (for storing images) and lesser network transfer cost.

2. **Build time**: As developers build and deploy multiple times to staging environment(s), shorter build times encourage them to iterate faster and not lose context of things. When build times were higher, developers often switched to other tasks after triggering builds.


## Bonus

There's a very nice tool that helps to analyze docker images layer-by-layer. Although it didn't help me a lot to reduce the size, it was a good experience diving deeply into layers. It's known as [dive](https://github.com/wagoodman/dive) and it's an open source tool that you can install on your machine to analyze any docker image. It also made me understand how docker ignores the intermediate stages of a multi-stage build and just copies the artifacts.

## Closing thoughts

Docker build time/size reduction is an interesting activity. There are some thumb rules (like moving less changing layers above) and some experimentation according to your app's setup. You need to experiment a lot to understand what works for you. If you have a similar experience, or any suggestions on the above - please do comment.
