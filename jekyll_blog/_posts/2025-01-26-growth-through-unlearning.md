---
layout: post
title: "Growth Through Unlearning"
date: 2025-01-26
published_on: "26th Jan, 2025"
author: Gagandeep Singh
image: "/assets/images/2025-01-26-unlearning.jpg"
categories: learning growth unlearn innovation
excerpt: In 2022-2023, I spent at least two afternoons each week discussing architecture with two senior colleagues at my company. We had hired many people, expecting growth, and decided to transition from a monolith to microservices. During one discussion about a central authorization service...
---

Photo by <a href="https://unsplash.com/@timmossholder?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Tim Mossholder</a> on <a href="https://unsplash.com/photos/love-to-learn-pencil-signage-on-wall-near-walking-man-WE_Kv_ZB1l0?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

> Notice if you’re describing a problem in terms of a solution you’ve already chosen — this can be a mental block for a lot of engineers. We start out by comparing problems to solve, but find ourselves talking in terms of technology or architecture we “should" be using to make everything better.
>
> **\-Tanya Reilly, The Staff Engineer’s Path**

# Introduction

In 2022-2023, I spent at least two afternoons each week discussing architecture with two senior colleagues at my company. We had hired many people, expecting growth, and decided to transition from a [monolith to microservices](https://blog.gagan93.me/monolith-microservices). During one discussion about a central authorization service, I kept drawing ideas from a system I had built in the monolith a few years ago. This is common among engineers: they often jump straight to solutions without fully understanding the problem, suggesting what they already know. This issue isn't limited to engineering teams; even product and design teams can overlook problem details and plan to create solutions similar to what they've done before.

Many industry leaders like hiring people with similar past experience, but that shouldn't stop you from finding better solutions. When you face a similar problem, some parts might be different, so the same solution might not work directly. If you overlook these small but important details, you might implement an unoptimized solution.

# The tale of two RBAC systems

In the past, I had developed a [Role-Based Access Control (RBAC) system](https://en.wikipedia.org/wiki/Role-based_access_control) for a customer-facing application using SQL tables. This system was designed to manage user permissions efficiently by assigning roles to users and controlling access based on these roles. A few months after the implementation, we began optimizing the SQL queries for our application to enhance performance. During this process, we discovered that the tables associated with the RBAC feature were among the top 10 most frequently accessed tables. This was because the data from these tables was loaded before almost every API call, which significantly impacted the application's performance.

As an improvement, we decided to implement caching for this data. We set up a cache to store the this data and configured it to invalidate whenever a new role was assigned to a user. Since role assignments were not very frequent, this approach was feasible and effective. Within a month, we successfully eliminated 4-5 database queries that were previously executed @ 40 queries/sec.

A few years later, I encountered another RBAC system in a different application, and here were the differences between the two:

1. The system was designed for internal users (instead of customers) and there was no chance that the customer side would need this functionality due to the nature of the business.

2. It was built using **configuration files** and **one SQL table**, instead of **multiple** **SQL tables** that use joins to get required data.

3. In the newer system, changing roles required a deployment because these configuration files were part of the repository code. In my old system, we had an admin page to update the database entry (and a callback to refresh the cache as well).


When I first saw this new system, it seemed like a misnomer, but this is how it was perfect for their use case:

1. Since this was built for internal users, there was no need to update the data often. Plus, the number of internal users was under a thousand.

2. There was no need for a caching layer because the configuration files were only loaded once, during app startup.

3. The team wanted to track changes to the permission system, and they thought using Git was the best way to do it 🤓. Sure, a maker-checker system could have been created for logging changes if SQL tables were used, but that requires separate effort.


So which system is better? The one built on SQL tables or the one that mostly used configuration files 🤔?Take a moment to think before you continue reading.

---

Seasoned engineers would sum it up in two words: *It depends* 😆.

Both systems worked well for their specific use cases without causing any issues for the end user. If I were to design the second system after creating the first one, I might have made the same mistake of using SQL tables and joins because that would have been the "standard solution" I remembered. But now, looking at both, I see that each was built according to its **requirements** without **over-engineering** for the future. In fact, *over-engineering* is very common in software engineering (been there, done that).

Again quoting from the *Staff Engineer’s Path*.

> An engineer who is not busy can be inclined to make work for themselves. When you see a vastly over-engineered solution to a straightforward problem, that’s often the work of a staff engineer who should have been assigned to a harder problem.

For this issue, building a solution based on SQL tables would be considered *over-engineering* because:

1. There was no need to update roles dynamically (without deployment).

2. Implementing the same on the SQL layer would call for a separate maker-checker system to monitor the changelog.

3. Additionally, future work might involve developing a caching layer since the data rarely changed.


# Comfort resists innovation

Over the past few years, a notable portion of my work has focused on simplifying systems that have become increasingly complex due to ongoing product changes implemented by various developers. As I work on enhancing these systems, it is crucial to first gain a thorough understanding of their current behavior. This often involves interviewing individuals who have been involved with the system for a long time. These individuals tend to be very **familiar** and **comfortable** with the system as it stands, having witnessed the gradual increase in complexity and understanding the reasons behind each modification.

This sense of **comfort** can be problematic because it prevents them from envisioning a newer, more streamlined version of the system that would be easier for everyone to comprehend. Their familiarity with the existing complexity, combined with limited exposure to effective design principles, often leads them to believe that the current state is the optimal way to construct the system. This mindset results in a lack of motivation to pursue [incremental improvements](https://blog.gagan93.me/refactoring-lessons-learnt-so-far#heading-keep-changes-small-and-reversible) that could make the system more efficient and user-friendly. Consequently, they may not plan or implement small, reversible changes that could gradually enhance the system's design and functionality.

In this case, **unlearning** is important so that you can think of the system from a fresh perspective and think of an alternate, simplified architecture. This would help you:

* To recognize that some of what you "know" might not be **universally correct** or **applicable everywhere**.

* To let go of **fixed patterns** that prevent you from adapting to new situations. In order to grow, it’s important to not rely on such patterns.

* To shed the confidence in solutions or methods simply because **they worked in the past**. Assumptions based on past experiences can lead to flawed conclusions or solutions when circumstances change.


# Some personal examples

Software Engineers need to constantly unlearn the old concepts so that they can build efficient systems. Throughout my career, I've encountered numerous instances that have taught me the importance of being willing to **unlearn** outdated methods.

These are some instances where **unlearning** helped me:

1. If you're used to working with monolithic systems and switch to microservices (or join a team using microservices), you need to unlearn some habits and adopt new ones. In a monolithic system, you rarely deal with timeouts because all the data is usually in one database that your app is always connected to. But in a system that constantly gets data from other services, you have to consider timeouts, retries, and fallbacks (if available). You'll also learn new concepts like circuit breakers, centralized logging, inter-service authentication, etc. If you stick to the old monolithic way of coding in a microservices setup, you'll create inefficient solutions. (Learn more [here](https://blog.gagan93.me/monolith-microservices)).

2. The simplest and slowest way to build a module is to execute all statements sequentially. For instance, in an e-commerce system, when an order is placed, tasks like sending notifications to the user, notifying the warehouse, and processing the payment are often performed one after the other. This sequential approach can cause inefficiencies and delays. By adopting asynchronous processing frameworks, you can enhance performance by allowing each step to be handled independently and concurrently. It's crucial to unlearn traditional methods and embrace the intricacies of asynchronous distributed systems to develop scalable and efficient solutions.

3. My first company operated in a "work from office" mode. During my second role, we transitioned from being "in-office" to "work from home" due to the COVID pandemic. Now, I am part of a fully remote team with members spread across different time zones. The skills required to thrive in these varied work environments differ significantly. For instance, in a remote setting, effective written communication is crucial to ensure that messages are clear and not misinterpreted by colleagues from diverse cultural backgrounds. Additionally, it's important to recognize that team members may not always be available simultaneously. Therefore, it's essential to plan your workday strategically. Tasks requiring input from others in different time zones should be scheduled when they are available, while you can focus on tasks that can be completed independently during other times. This approach helps maintain productivity and ensures smooth collaboration across the team.

4. The transition from on-premise to cloud virtual machines, and now to Kubernetes pods, has introduced a more ephemeral nature to what we consider a *server*. I recall a high-rate ingestion service in our old organisation that buffered data temporarily to disk when the consumer was down. This application ran on AWS EC2 machines, which are less ephemeral than Kubernetes pods, and the design worked well despite using [instance stores](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html) that do not persist through EC2 stop/start cycles. In a Kubernetes environment, designing this would require a different approach because pods can be terminated for various reasons and with higher frequency. To handle this, you might need to implement persistent storage solutions like using Persisted volumes, StatefulSets or external storage systems such as Amazon EBS to ensure data durability and availability when pods are frequently restarted or rescheduled. This shift necessitates a rethinking of how data persistence and application state are managed in cloud-native architectures.


Unlearning old habits was crucial for my growth as it allowed me to adapt to new technologies and methodologies. By shedding outdated practices and embracing continuous learning, I was able to contribute to the development of more efficient and scalable systems.

# Conclusion

In this brief blog post, I've highlighted the significance of **unlearning** and its vital role in fostering innovation and adaptability for professionals across various fields. By letting go of preconceived notions and outdated solutions, we can tackle problems with fresh perspectives, resulting in more efficient and context-appropriate outcomes. Embracing unlearning as a practice can significantly contribute to personal and professional growth, enabling individuals to stay agile and responsive in an ever-evolving landscape.

---

If you liked this post, please read these too:

1. This is my second blog post related to **growth**. The first one talks about [habits, productivity and deep work](https://blog.gagan93.me/habits-productivity-deep-work)

2. It’s important to manage your time when you’re thinking about growth. I shared [my thoughts](https://blog.gagan93.me/cost-of-time) on the same an year ago.

3. If you’re transitioning from monolith to microservices and are looking for a scalable way to migrate data, read [this post](https://blog.gagan93.me/migrating-data-across-services) once.
