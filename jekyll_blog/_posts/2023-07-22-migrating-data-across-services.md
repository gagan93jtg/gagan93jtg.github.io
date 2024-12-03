---
layout: post
title: "Migrating data across services"
date: 2023-07-22
published_on: "22nd July, 2023"
author: Gagandeep Singh
image: "/assets/images/2023-07-22-migrating-data-across-services.jpg"
categories: architecture data-migration kafka
excerpt: Today, I'm explaining how we planned to transfer millions of rows "reliably" to a different service during our journey to services architecture.
---

Photo from <a href="https://www.datanami.com/2019/12/12/google-launches-transfer-service-for-on-prem-data/">Datanami</a>
---
{: style="text-align: center;font-size: 0.8em"}

With reference to my [last post](https://gagan93.me/blog/2023/07/14/mindset-shift-monolith-to-microservices.html) and comment on the corresponding [LinkedIn post](https://www.linkedin.com/feed/update/urn:li:activity:7085911288056299520?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7085911288056299520%2C7085935059165192192%29&replyUrn=urn%3Ali%3Acomment%3A%28activity%3A7085911288056299520%2C7086039096455815168%29), I'm explaining how we planned migrating data while transitioning to microservices architecture. There can be multiple approaches to do the same. In a nutshell - we simply want to replicate the data to the new service in a reliable manner at scale.

1. **Dump and restore the table on database level** - Whatever database you're using, there should be some utility that allows you to do the same. But this is a one time operation, and doesn't ensure continuous sync of data. For the systems that hardly change, we can do this. Another thing that we assume here is that schema is exactly the same. Often, when we transition to services, some columns change or get removed (eg. foreign keys that no longer exist in new system). So this is very less likely to be used.

2. **Setup hooks in old service & continuously sync data** - I assume that your MVC architecture would help you to setup such hooks. Eg. we use `after_commit` callbacks in Rails models to replicate such data. And some custom scripts (or rails console) to backfill existing data. Depending on size of data this might take a lot of time to backfill existing data, but should replicate the complete data on the new system.

We used the second approach, architected by Nimish Mehta (Senior Staff Engineer @ LocoNav). Even to implement this approach, there are multiple ways, where each has it's own complexity and reliability:

1. **Directly replicate data** - Here, we'll simply use the hook in the first application to hit some REST/grPC endpoint of the second application. This should work well till the second system is up and running. Incase the second system goes down, our application should have sufficient retry mechanism before it considers to stop sending further data, or to mark the current packet as `failed`. There are more things that can happen. Considering a large system, where many such use cases will exist, it was inefficient to build this intelligence in all of them. We needed a better solution.
![cover-photo](/blog/assets/images/2023-07-22-data_migration_arch_1.jpg){: style="margin-bottom: 40px;"}
2. **Producer-consumer pattern** - We thought of setting up a queueing mechanism using Kafka topics. The primary app (_producer_) shall publish the data on kafka topic and the new app (_consumer_) shall read the data from kafka topic whenever it is available. Though this sounded good, it would mean that all such consumer applications shall have the logic to read kafka topic and maintain success/failure logs. This was again adding complexity to each consumer application, and hence this solution was not optimized for the long run.
![cover-photo](/blog/assets/images/2023-07-22-data_migration_arch_2.jpg){: style="margin-bottom: 40px;"}
3. **Setup an app in the middle** - The best solution that we found was to have an app in between producer and consumer. So it goes like - your producer app publishes the data on kafka topic and your consumer app exposes a REST endpoint that accepts data in a known format. In the middle, we have an application that takes care of:
* Reading data from Kafka.
* Formatting it to JSON (from optimization perspective, we published in [protobuf format](https://github.com/protocolbuffers/protobuf)).
* Pushing to consumer application's REST endpoint.
* Having enough retries and a lot of configuration around the same.
* Scalable, partitioned database that stored logs of all requests sent to the REST endpoint.
* Provision to retry upto `MAX_RETRIES` (configurable) per use case.
* Provision to retain success/failure logs upto certain hours/days (configurable), and much more.
![cover-photo](/blog/assets/images/2023-07-22-data_migration_arch_3.jpg){: style="margin-bottom: 40px;"}

We found the third architecture best for our use case because it has almost zero duplication of code/optimizations on producer or consumer end. Also, in case we need to build anything in future (eg. a UI to query failure logs, or a button to retry), we'd just need to build in the central app. From our experience, I can say that it has solved a lot of pain for other teams because success/failure logs become large with time and none of the team need to worry about it because the team maintaining this central app ("developer productivity team") takes care of that. This simplifies both apps and life of other developers 😇.

See you guys in the next post.

