---
layout: post
title: "Avoid Redundant Complexity"
date: 2023-08-19
published_on: "19th August, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-08-19-avoid-redundant-complexity.jpg"
categories: complexity system engineering
excerpt: During my college days, I came across a code in C++ prints map of India. The code was obfuscated and hence very hard to understand. I took me days to understand what magic it is doing, but at that time I thought complexity is good....
---

![cover-photo](/blog/assets/images/2023-08-19-avoid-redundant-complexity.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"
}

Photo by <a href="https://unsplash.com/@magict1911?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Timo Volz</a> on <a href="https://unsplash.com/photos/9Psb5Q1TLD4?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

During my college days, I came across a code in C++ prints map of India. The code was obfuscated and hence very hard to understand. I took me days to understand what magic it was doing, but at that time I thought **complexity is good** as it sparks curiousity in the mind of reader, like it did for me. Little I knew that it's just fancy stuff that no one writes in production.

Fast forward to 2023: Having worked on multiple products and with multiple teams, I completely understand how much developers hate complexity (atleast mentally, if not otherwise). The art of system design is to fulfil the requirements without introducing a lot of moving parts. For example, if you are writing a fresh system that will not have 1 million users in the first month, don't introduce a caching layer in your first version. Have some monitoring in place for everything possible and let the numbers speak if you need more specialized systems here.

Although what I just wrote is very obvious for most of the developers, we still end up introducing un-needed moving parts sometimes (for fun / learning purpose). Developing a new software requires comparitively larger team than what we have when we're just maintaining the system. But that is true only if the system is _simple_ enough. If we have extra technologies put in place, then we'll need people who:
1. Have working knowledge of those systems.
2. Can tune the systems on scale, if needed.
3. Handle version upgrades.

and so on.

In 2021, we expanded our engineering team @ LocoNav and people joined us with different technical expertise in databases, languages, frameworks and cloud providers. We saw this complexity coming in our way very early, so we planned to reduce the decisions our team will take in future while building new systems, or refactoring existing ones. For example, for a relational use case, someone from enterprise background had experience using Oracle database, while some had experience with MySQL. Even I was using MySQL before joining LocoNav. But here we're using Postgres for all our relational use cases. We have expertise in tuning this according to our needs and have seen some challenges in the past that made us somewhat expert in managing this. We also run self managed Postgres on EC2 machines where we need more flexibility, and even understand the challenges that come with self-hosted databases. Additionally, we use PGBouncer for connection pooling in one of our major apps. As developers, we know that almost 90% (or even more) use cases can be solved with equal complexity in all SQL databases. And if we have a good ORM adapter, there's zero difference in the way our app interacts with the database. Given all the experience with have with Postgres, it doesn't make a lot of sense to let individual teams choose their own SQL database. Staying on single SQL database helped us **reduce complexity** as an engineering team, specially when we launched new LocoNav clusters for countries that have data residency laws.

The same is true for many other things. If your team prefers ELK (for example) to keep application logs, and there's some new technology out that sounds promising and cheap, don't go for it unless you've done the POC for your use case and you're planning to slowly shift everyone on the new stack. Teams often get excited to try new tech (which is not bad for learning purpose) and end up maintaining 3-4 technologies for the same use case.

There's another perspective in which we can reduce complexity - don't introduce specific technologies unless you really need them. This helps keep your technology stack easily maintainable in the long run. Sharing some (opinionated) conclusions from my experience:
1. Don't introduce a caching layer unless your database needs it. Caching done in a bad way can create more bugs than benefits.
2. Don't launch a NoSQL database to serve 1-2 non-relational use cases. Use JSON columns if that works for you. That eliminates maintenance of one new component. Only if you think you are introducing more complexity in the system by using JSON columns, or if you have more use cases now, shift to a NoSQL database.
3. Don't use a NoSQL database just because you're 90% sure of the schema, and you think you need "some flexibility". Schema helps to enforce an expected design. Stick to it if possible.
4. Don't introduce complex things like API gateways, CDNs in early stage of your app. That might be completely redundant.
5. Reduce the no. of programming languages in the engineering team unless you have a really large (>500 engineers) team. Stick to 2-3 max.
6. Try not to lock yourself in a single cloud vendor. Try to architect your system with components that are available in all the clouds, or as system binaries. Docker/Kubernetes are good examples here.
7. Don't follow what sounds cool on discussion forums. These days, few things that sound very cool are: **microservices**, **multi-cloud setup**, and **moving from cloud to self hosted infrastructure**. Each of this requires very specific expertise, and should be chosen if the needs are very specific. Otherwise it's just _adding to the complexity_.

Complex systems are harder to explain to new developers. Redundant complexity is a huge tech debt and we should try to avoid it. And this applies to all walks of life, not just tech. For example, for many years I kept using a simple text file in my sublime editor to note down pending tasks. I simply removed the task from the list once it was done. Although it did not give me a lot of features that a tool would give, but it was dead simple to use. As the complexity grew and I was also required to keep track of work done in the past, and plan future tasks in detail, I moved to Notion. These days I use mix of both 😁.

I hope I was able to explain what is complexity and why we should avoid it. Take care and see you guys in the next post.


