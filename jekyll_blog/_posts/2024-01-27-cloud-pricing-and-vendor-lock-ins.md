---
layout: post
title: "Cloud pricing & Vendor lock-ins"
date: 2024-01-27
published_on: 27th January, 2024
author: Gagandeep Singh
image: "/assets/images/2024-01-27-lock-in.jpg"
categories: cloud pricing lock-in
excerpt: Cloud pricing is complicated. If you are trying to optimize a cloud bill for the first time that mentions more than 10 managed services, it can take a decent time to understand how this is computed. Although most of....
---

Photo by <a href="https://unsplash.com/@mr_williams_photography?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Micah Williams</a> on <a href="https://unsplash.com/photos/black-and-gray-code-padlock-anchored-on-chain-link-fence-selective-focus-photo-lmFJOx7hPc4?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

Cloud pricing is complicated. If you are trying to optimize a cloud bill for the first time that mentions more than 10 managed services, it can take a decent time to understand how this is computed. Although most of this article will talk about pricing w.r.t AWS Cloud, most of the public clouds work like that. If I was to explain on a very high level, these are a few things that should help in understanding pricing:

1. **PAYG** (Pay as you go) - Most of the cloud providers charge in a prorated manner - i.e. if you use a service for 2 days out of 30 days and the monthly charge was $90, so you end up paying $6 only (simple maths). Since 2017, AWS shifted to [per-second billing](https://aws.amazon.com/blogs/aws/new-per-second-billing-for-ec2-instances-and-ebs-volumes/) for many of it's services.

2. **Machine size** - Bigger the hardware, more is the cost. For most of the cases, a machine having 4 core and 16G RAM will cost exact double of machine that has 2 core and 8G RAM. I think this is very obvious.

3. **Commitment** - If you commit to use a hardware for a given period (say 1 or 3 years), you get it at a discounted price (explained [here](https://aws.amazon.com/ec2/pricing/reserved-instances/)). Here the downside is that even if you don't use the hardware (after say 7 months), you still pay for the remainder period (say next 5 months) because you committed to use it. Another option allows committing a fixed usage value (read [this](https://aws.amazon.com/savingsplans/) to know more).

4. **Data transfer** - This cost can increase if your user base is growing, depending on how much data is transferred between your application and the end user. I find data transfer as the most complex component of the bill. You can read [this](https://aws.amazon.com/blogs/architecture/overview-of-data-transfer-costs-for-common-architectures/) to understand more on how this works.

5. **Kind of service** - Each service can have it's own pricing component that makes sense for it. As an example:

    1. A load balancer like ALB / NLB has a fixed monthly cost + cost of data transferred through it (explained [here](https://aws.amazon.com/elasticloadbalancing/pricing/)).

    2. A blob storage service like S3 bills according to storage class and obviously considers the size of data you're storing (explained [here](https://aws.amazon.com/s3/pricing/)).

    3. A Disk storage service like EBS has a different charge for different kinds of disk (GP2/IO1), for provisioned IOPS, etc (explained [here](https://aws.amazon.com/ebs/pricing/)). Additionally, a disk attached to a database service like RDS is slightly costlier than one attached to a EC2 machine.


---

The above section is a very brief introduction to cloud pricing. You might have encountered new terms so I've attached some links that will help you understand more. In the last point, I tried to write in a *metaphorical sense* rather than simply mentioning fancy AWS service names. That has a special motive. From an architecture perspective, we should treat a load balancer as a load balancer, and not assume that we always need "AWS Application Load Balancer". This thought process helps in decoupling our architecture from a specific cloud provider's service.

As this might not make much sense for some readers, let me explain more. If your product uses a lot of "provider specific" services, it might be harmful for you in the long run. As an example, if your code expects a lot of AWS Services to accomplish a task, you might not be able to exit AWS anytime in future (without significant investment). At this point, you might think - **Why would I want to exit AWS**?. While this is a valid question, and most of the teams would not want to invest in this (risk-taking) migration, there are a few cases I know where people have done this and are expected to save a lot of dollars in the long run. The most popular ones I know are [Dukaan](https://www.youtube.com/watch?v=vFxQyZX84Ro) and [Basecamp](https://world.hey.com/dhh/we-have-left-the-cloud-251760fb).

Another reason to design [cloud agnostic](https://www.synopsys.com/cloud/insights/cloud-native-vs-cloud-agnostic.html) systems is to be able to sell in certain markets. When [LocoNav](https://loconav.com/) expanded its sales beyond India, numerous markets had stringent data residency and localization laws. However, none of the prominent cloud service providers had established data centers in those countries. At that time, our infrastructure was completely on AWS but we were not completely locked-in as we had self-managed installations of a lot of things. For example, despite using Elasticache for Redis, we were also having self managed redis servers (on EC2). We knew good and bad of both the worlds. Same goes for our SQL database - While most of our postgres use-cases are on RDS, we also have large self-managed postgres installations on EC2 as well. Beyond this, we were also using load balancers and S3 from AWS heavily, but we were able to find open-source alternatives for both of these that helped us in making the architecture truly cloud agnostic. Today, although the process of setting up a new deployment is not one-click, it is doable with some effort and most importantly - possible without relying on a specific provider (AWS in our case) 😇.

On the other hand, had we been deeply locked in one vendor, it would not have been possible to sell in these countries. By being cloud agnostic, I do not mean that we should manage everything on our own even if new cloud provider is providing those services. For example, we use kubernetes for deploying our containers. While we completely manage Kubernetes on our own in some small cloud providers (where we just get bare VMs), we prefer using EKS on AWS and AKS on Azure. Similarly, we use [minio](https://min.io/) as a self-managed option for S3 in some cloud providers but for OCI, their own object store is pretty good. The best part here is that both minio and OCI Object store have very good API compatibility with S3, so no code changes were required to work with these backends.

Cloud native or cloud agnostic - both the patterns have their own merits and demerits. As an architect, I'd recommend you to stay flexible and build what suits the best for your business. Using a managed service can be easy to begin with but always remember the caveats. You can also modularize your code in a way that the outermost layer (eg. service layer for APIs) doesn't directly interact with the innermost layer (eg. that calls the specific service). There should always be some layers of abstractions that can help you shift to a different backend easily.

I hope this article gives some idea around cloud pricing and vendor lock-ins. If you have had an experience doing the same for your product, or if you have any questions around the same, please share in comments.
