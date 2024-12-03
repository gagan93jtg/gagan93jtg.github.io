---
layout: post
title: "Devops Essentials for Developers"
date: 2024-03-05
published_on: 5th March, 2024
author: Gagandeep Singh
image: "/assets/images/2024-03-05-devops-servers.jpg"
categories: Devops Cloud Developers
excerpt: In my ~ 9 years of experience, my work has been a mix of Backend and Devops. Getting my hands dirty on Devops side has given me a lot of edge in understanding things related to deployment, cloud, servers and operating systems that other developers couldn't easily understand. For example...
---

Photo by <a href="https://unsplash.com/@tvick?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Taylor Vick</a> on <a href="https://unsplash.com/photos/cable-network-M5tzZtFCOfs?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

## Background

There are multiple definitions of the term **DevOps** throughout the industry. I'll share a few and then we'll discuss more on them:

1. **Philosophical definition (by AWS)**: DevOps is the combination of cultural philosophies, practices, and tools that increases an organisation’s ability to deliver applications and services at high velocity: evolving and improving products at a faster pace than organisations using traditional software development and infrastructure management processes.

2. **In relation to code**: DevOps involves some coding, but it's not primarily about writing code. It's more about improving processes, collaboration, and automation in software development and IT operations. While coding is essential for creating automation scripts and tools, it's just one aspect of DevOps.

3. **As a career / job profile**: Depending on kind of organisation, there might be different expectations. A decade ago, the work was more around physical server administration when the Devops team was responsible for handling physical servers (and later, cloud servers). In the recent years, most of the organisations have delegated the server administration to cloud providers. And the expectations have shifted to knowledge of technologies like **Containerization** (Docker, Kubernetes), **Observability** (Grafana, NewRelic, Datadog), **IaaC** (Terraform, Ansible), **Cloud cost optimisation** (planning infra reservation), etc.
    By job titles, organisations can have different profiles like Cloud Engineer, Site Reliability Engineers, IaaC Engineer, Automation Engineer, System Administrator etc.


## Introduction

In my ~ 9 years of experience, my work has been a mix of **Backend** and **Devops**. Getting my hands dirty on Devops side has given me a lot of edge in understanding things related to deployment, cloud, servers and operating systems that other developers couldn't easily understand. For example - whenever I was working on a new project, I had a decent idea of what memory/CPU we'd allocate to it in staging and production environment. Not only this, I use to go ahead and provision the infrastructure myself. Someone might see this negatively, specially when you have had dedicated Devops team(s) in your company. In most of the organisations, there's a clear separation between the responsibilities of Developers and Devops. And developers never get into infra related things. In my case, there were two major reasons why I got into Devops:

1. [My first project](https://copperegg.com/) in first organisation was a monitoring product for Devops (similar to Datadog/NewRelic). When I started working on it, it was acquired by a larger company and we were mostly maintaining it. Because we were not building new features, the customer base was not growing and our sprint tasks often involved assessing current infra and downsizing the infra. Around the same time, we planned a long migration from AWS Classic to AWS VPC (it was a big deal back in 2016-17). Most of these tasks were on the Devops side and there was 1 only Devops resource allocated to us. As a result of all these activities, all the developers (we were 3 people) became Devops experts. Within 2.5 years of work, I was hands on with AWS EC2, S3, RDS, R53, VPC, SQS and Unix servers.

2. In my second job ([LocoNav](https://loconav.com/)), we did not have a dedicated Devops team for first few years. We had at max 0-1 Devops on and off, so some engineers like me (who knew cloud & servers) took care of the Devops side. As a result, we mentored many developers to work as Devops (while we were primarily Rails, Java and Golang Developers).


For me there is not even a thin line between Developer tasks and Devops tasks. I swiftly switch between those as needed. But rest of the developers (who are not into Devops) feel like they're missing something. During 1:1 meetings, we've got this feedback from many Developers that they want to learn at least some part of Devops things we do. We encourage and guide people as needed because we feel this is a good added skill. I often see job descriptions where companies expect some understanding of Devops philosophy even from SDE candidates. Today, I'll try to bridge the path between these two disciplines so that you have an idea on how to start.

## Things to know

I'd assume you are a typical SE/SSE who is majorly writing code, writing test cases, raising pull requests and merging pull requests. You might also be using something like *Jenkins* to build and deploy your code to an environment. You might be deploying on VMs (eg. physical / EC2), some wrapper around it (eg. Heroku / Elastic Beanstalk) or as docker containers on kubernetes (EKS / AKS / self hosted).

First of all, you need **genuine curiosity** to learn anything not just Devops. Here, by *curiosity* I mean you should be curious to know:

1. What happens after you click the *Build now* button on Jenkins (for example).

2. What is a Jenkins project? How do we configure one?

3. Where do we mention the steps that execute to build a project?

4. Do you understand the logs (specially errors) that come in the console output of your build tool? Are you able to debug the errors or you call the Devops guy? Knowing how to interpret logs and debug issues is an underrated skill. It can take you miles ahead from others.


Once you have that curiosity, you'll try to **look beyond code**. [Ask questions](https://blog.gagan93.me/asking-good-questions) to learn more about your overall architecture:

1. Which cloud provider(s) your team uses to deploy the code?

2. How are different components (eg. servers, databases, caches) connected to each other in a production environment? Is it different for staging, preprod or dev environment?

3. How does your service interact with rest of the services? Is there an architecture diagram of the system that you can refer?

4. Do you guys deploy on bare metal servers or cloud servers? Or do we deploy as containers?

5. What operating system is used to deploy your code? Even if you're using containers, there should be one OS that is actually base image of your containers.


By asking these questions, you'll get to hear a lot of buzzwords like "dockers", "AWS", "kubernetes", "API Gateway". Now it depends on what you want to learn and what you want to skip. At a minimum, I'd recommend knowing something around:

1. **DNS / Networking** - *"What happen within the time when you write google.com in your browser and when the page renders on your browser window?"*. For years, this has been my favourite interview question. I've asked this to all levels of engineers, and (obviously) got different level of detail in the answer. If your answer mentions DNS servers, IP resolution, proxy servers/load balancers/API gateways, Application server, request parsing, routing the request to specific handler (*controllers* in **MVC**), querying the backend (if a dynamic page), and rendering the response in the browser, then you know most of it. If not, please read about each of these things. Beyond this, you should know about basic networking like LAN (eg. your mobile/laptop are within the same network at home/office, i.e. a LAN). Also have some basic knowledge around IPv4/IPv6, [IP Address classes](https://www.google.com/search?q=class+A+to+E+IP+addresses&oq=class+A+to+E+IP+addresses&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBCDM1NzhqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8), [reserved address spaces](https://www.tutorialspoint.com/ipv4/ipv4_reserved_addresses.htm), etc. It will help you later understand subnets and VPC in the cloud.

2. **Cloud Provider** - There major ones are [AWS](https://aws.amazon.com/), [Azure](https://azure.microsoft.com/en-in) and [GCP](https://cloud.google.com/). There are many more like [Linode](https://www.linode.com/), [DigitalOcean](https://try.digitalocean.com/), [Heroku](https://www.heroku.com/) and newer ones like [Vercel](https://vercel.com/) and [Netlify](https://www.netlify.com/). On a fundamental level, they all started with the same thing - providing you an easy way to provision a computer (i.e. a server) with required RAM, CPU, Disk and networking. Later, they evolved into more sophisticated platforms, providing variety of servers based on use case like general compute, memory heavy tasks, gaming, machine learning, etc. Beyond this, nowadays they also provide managed SQL/NoSQL databases, email service, DNS management, API Gateways, Docker image repositories, managed kubernetes service and practically everything you would need to run a medium-large app on the cloud. AWS alone provides 200+ managed services in the cloud 🤯.

3. **Data-centers, regions and lags** - Let's assume that most of your customers are in India and your servers are also in India. By India, I mean your servers are either physically managed by you in a datacenter, or are running on a managed provider like [AWS in mumbai](https://aws.amazon.com/blogs/aws/now-open-aws-asia-pacific-mumbai-region/) or [DigitalOcean in Bangalore](https://www.digitalocean.com/blog/introducing-our-bangalore-region-blr1). Here, the [TTFB](https://en.wikipedia.org/wiki/Time_to_first_byte) and overall request will be fast, in an ideal scenario where other factors like server load and network congestion are low. Incase your customers are in India and servers run in Singapore, then it will be slightly slower. Similarly, if you go even far and move your servers to North America, then the request latency can increase. I think you got a basic idea of physical distance here but this is more related to DNS hops. Cloud providers provision a server for you in a specific region chosen by you (eg. Mumbai). Even in Mumbai, they will not have a single data center. So they can allow you to choose a specific data center (AWS calls them [availability zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-availability-zones)) where you want to run your server. If two servers are running within the same data center, the network transfer speed among them will be maximum. But this doesn't mean that you should run all your API servers and databases in a single data center because if one data center goes down ([although rare](https://www.reddit.com/r/aws/comments/b90kof/how_often_does_a_region_go_down_what_about_azs/)), your entire application will go down. From a stability and fault tolerance perspective, these cloud providers isolate the regions from each other completely.

4. **Build and Deployment process** - For many developers, deployment process is magical and "just happens".

    * Learn what happens during build and deployment of your app. Based on the size/complexity, this can take some time to dive deep but trust me, you'll learn **a lot** in this process.

    * Understand what are the artifacts (output) of your build process. If it's a Java project, you'll possibly get a JAR/WAR file after the build is complete. For a Golang project, you'll get a executable binary. For interpreted ones like Python and Ruby, your raw code is the artifact. This could be docker image (irrespective of the tech stack) if you're building docker images and deploying them to swarm/kubernetes.

    * Learn about your build tool. [Jenkins](https://www.jenkins.io/) is a widely used build tool. If you're also using this, learn how to create projects, understand what is a build script, learn about pipelines, read about jenkins slaves and farms.

5. **Containerisation technologies** - Everyone is doing micro-services these days (although that [might not be the best choice](https://adevait.com/software/why-most-startups-dont-need-microservices-yet) if you're a startup). In a micro-services architecture, the teams are free to choose their own tech stack to develop services. While it gives you this freedom, it makes hard to choose and manage the deployment tooling. Containerisation technologies streamline the build and release process for multiple technology stacks. For example, Docker provides standardised containerisation framework for applications, while Docker Swarm / Kubernetes offer orchestration to efficiently manage deployment, scaling, and communication across services. Knowing these technologies would help you to write efficient Dockerfiles, [create optimised images](https://blog.gagan93.me/optimising-docker-builds) and write helm charts. These things will help to take new projects beyond the dev environment.

6. **Operating system knowledge** - It's important to have knowledge of the specific OS where your apps get deployed. Here I'm not focussing on core OS concepts like mutex, semaphores or process scheduling. We should have operational knowledge of the OS so that we can easily debug issues as required. For example, we've been deploying our apps on Debian (Unix) for years. So we have a decent idea around [systemd](https://systemd.io/https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-managing_services_with_systemd), [crontabs](https://www.techtarget.com/searchdatacenter/definition/crontab), [syslog](https://www.sumologic.com/syslog/), [authlog](https://unix.stackexchange.com/questions/545083/auth-log-entries-how-do-you-interpret-this-log), [apt](https://wiki.debian.org/Apt) (our package manager), [OOM](https://neo4j.com/developer/kb/linux-out-of-memory-killer/) and bunch of unix commands that ease our debugging. Without this knowledge, you'd want someone to hold your hand while debugging a server issue.

7. **Observability** - Let's assume you wrote a module that has bunch of REST APIs integrated with mobile and web apps. The product was initially rolled out to 100 users, then 1000, and finally to everyone (say 1 million users). With time you'd see that some API calls fail with HTTP 500 due to an edge case that was never thought of. Once 10K entries are made in a SQL table, you might see a query slowing down because you forgot to add an index on specific table column and initially the data was not large enough to cause slowness. While debugging some cases, you'd need exact request parameters that came in a POST request to see what caused it to fail. And once there are 100 request per second, you will find a need to add more servers for your service. With system architectures becoming more distributed and on cloud, there's a need to be able to measure internal state of the system based on external inputs like logs, metrics and traces. This comes under *Observability.* Coming back to the specific examples: you would need an **error reporting** tool like Bugsnag/Sentry, to see the class/method/line where your code failed. You should have an **APM tool** like Datadog/NewRelic to see if some API calls or database queries are slowing down recently. It's important to have **centalized logging tools** (like ELK/Scalyr) in a distributed environment so that we can trace a request that routes through different micro-services to process a request. Similarly, **infrastructure monitoring** tools like Prometheus are important to have a high-level overview of your servers/containers. Observability is a very wide topic, and while all this sounds overwhelming, it is actually very easy to understand if you really get the core of the problem. For example, if we don't integrate an error reporting tool, how would we know what part of code is failing and on what line of code? Each tool solves a problem that might or might not be important to you based on needs of your product but it's important to know broadly what all tools exist.


## Conclusion

There are more things I can talk about (like IaaC) but I think this much should be good to start with. The best way to learn anything is to be hands-on. I'd suggest the following ways to get your hands dirty:

1. **Open source tools** (includes Jenkins, Grafana, Prometheus, Docker, Kubernetes, etc.) - All these tools are [FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software) and can be easily downloaded on your local machine. These are not heavy and many of them (eg. first three) come as docker images so you can uninstall them without bloating your machine.

2. **Cloud Platforms** - Most of the cloud providers have free-tier (eg. [1](https://aws.amazon.com/free), [2](https://cloud.google.com/free/docs/free-cloud-features), [3](https://azure.microsoft.com/en-in/pricing/offers/ms-azr-0044p)) so that you can learn things by doing (that's the best way I believe). Aim towards learning 3-4 specific services than randomly trying out services. Keep budget alerts so that you don't accidentally hit a [cloud overflow](https://www.youtube.com/watch?v=N6lYcXjd4pg).

3. **Other Platforms** - Almost all the platforms have free tier where they won't charge you unless you're pushing a lot of data (eg. a lot of traces to NewRelic or a lot of errors to Bugsnag, or many GBs of log data to Scalyr). Even they want people to use their platform so they encourage such free plans. Otherwise they at least have 15-30 day trial plans. Wherever you put your credit card, make sure your to setup some budget alert and remove the card after you are done practising. To avoid any mistakes that can cost you some dollars, concentrate and learn 1-2 things rather than picking 10 things at once.
