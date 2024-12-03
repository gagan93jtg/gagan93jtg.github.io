---
layout: post
title: "Low Level Design Interviews"
date: 2024-05-17
published_on: 17th May, 2024
author: Gagandeep Singh
image: "/assets/images/2024-05-17-lld.jpg"
categories: interview lld software-design
excerpt: I work as a Staff Software Engineer at LocoNav. When I give interviews with my current experience (that is close to 9 years), I am considered for these roles...
---
Photo by <a href="https://unsplash.com/@sambourke?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Samuel Bourke</a> on <a href="https://unsplash.com/photos/woman-in-gray-hoodie-sitting-on-chair-in-front-of-laptop-computer-foH9owaHXng?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
{: style="text-align: center;font-size: 0.8em"}

## Background

I work as a Staff Software Engineer at LocoNav. When I give interviews with my current experience (that is close to 9 years), I am considered for these roles:

1. Software Engineer / Senior Software Engineer,

2. Staff Software Engineer / Lead,

3. Engineering Manager (incase I want to move to a management role).


The responsibilities for each role are highly dependent on the organisation's needs, and it doesn't harm me in the long run if I switch from *Staff Engineer* to *Senior Engineer* in my next role, as some might think ([explained here](https://blog.gagan93.me/titles-inflation-and-down-levelling)). According to the role, the Low Level Design round and the overall interview process can be very different. Although the aim of this post is to talk about LLD with respect to interviews, but I believe it's a skill that should help you on your job as well. So don't limit your learning to interviews only.

## What is LLD?

From wikipedia:

> **Low-level design** (LLD) is a component-level design process that follows a step-by-step refinement process. This process can be used for designing data structures, required software architecture, source code and ultimately, performance algorithms.

There's a reason for sharing this formal definition. Unfortunately, the **interview directed preparation** has spoiled the **step-by-step** nature of Low Level Design for many people. In many cases, the interviewers expect you to magically present the best design with working code and test cases within 45-50 minutes. While this is somewhat doable by practising the common problems, this is not what design means in Software Engineering.

I've given about 5-6 LLD interviews and all of them were not of the same kind. I'll first share **how I prepared** for the interviews and improved my low level design skills in general. After that I'll share **my experience** with different kind of LLD interviews I gave. In the end, I'll share different **categories of problems** that I found in different playlists, courses and interviews.

## Learning and Improving LLD

Somewhere in late 2023, I was reached out by [Atlassian](https://blog.gagan93.me/atlassian-interview-experience) recruiting team on Instahyre when they were hiring for the position of Senior Software Engineer. At that time, I was having zero preparation and almost zero idea of the overall process. Their team phone called me to explain the entire process and shared [documents](https://online.flippingbook.com/view/325478/) that would help me to understand more about each round. I figured out there were three major things on the tech side - Data Structures, Low level design (LLD) and High level design (HLD/System Design). Going through details of each round, I figured out that I had practically worked on everything they would need, but I need to prepare in a way that I'm able to portray that during interviews.

As anyone would do, I searched for free content. There were plenty of excellent videos on YouTube but they varied in quality. This was a typical [information overflow](https://blog.gagan93.me/information-overflow) problem - pick anything you want to learn and there will be 100 people on YouTube already sharing how to do it. Not all of them are the best, and almost none of them are wrong but you need to choose and stick to one or two (else you'll get lost).

This was the pattern of each channel/playlist that was teaching LLD:

1. Teach SOLID principles,

2. Teach Design Patterns,

3. Choose 5-10 of the common problems (A TicTacToe Game, Snakes and Ladders Game, Elevators System, Building Splitwise, Car Rental platform, etc.). While solving these problems, they will try to fit in at least one / two design patterns in each problem.


I think this is a pretty good roadmap if you're only targeting interviews. Practice 5-10 problems in a way that you do not look into solutions before attempting them on your own. If you look into their solutions, they look very obvious and you get fake confidence that you know everything. I was in this situation for both LLD/HLD rounds where I thought that I know everything just because I watched videos. It was only after getting rejected in good companies, I figured out that *things are not that obvious*.

I'll discuss little bit about each point before moving forward:

1. **SOLID principles** - These principles act as foundation of good design if you're implementing your solution in an Object Oriented Language. I'm personally a very big fan of *Single Responsibility Principle* than any other rule or design pattern. I think if someone understands this well, they can write pretty neat classes and ensure no unnecessary sharing of code/properties among classes. I'll not explain these principles in detail here, but I'll leave you with an [excellent free blog](https://www.freecodecamp.org/news/solid-principles-explained-in-plain-english/) to read the same.

2. **Design patterns** \- These patterns are nothing but solutions to common problems that people face in Object Oriented Design. For example, in large projects, developers usually write layers of abstractions over language or frameworks. While designing these classes, they figure out that you need to provide a very simple and easy to use interface (API) for the end user. Such a pattern is known as a [Facade](https://refactoring.guru/design-patterns/facade). I've been using this pattern to build abstractions in my projects, even before I formally studied design patterns.
    If you're 3+ years of experience, there are chances that you've either read or heard about the [GOF book](https://www.geeksforgeeks.org/gang-of-four-gof-design-patterns/). This book is known to be the original work on design patterns. Although I got a chance to find [this website](https://refactoring.guru/design-patterns) (they also have a PDF book) that has very good examples and illustrations incase someone wants to learn about Design Patterns. One bonus thing about this website is discussed in the next point.

3. **(Bonus) Code smells** - Before I found a good content around code smells, I had read about a few of them in a separate blogs. Generally, no course suggests you to read about code smells, but as I promised to share content beyond interviews that would help you to actually build good LLD, I'd suggest you to read about common [code smells](https://refactoring.guru/refactoring/smells) and their corresponding remedies.

4. **Common coding problems** - Pick any playlist on YouTube and you'll find authors discussing around building your own small version of Uber, ZoomCar, BookMyShow, Splitwise and so on. I'll strongly suggest you to solve at least 5-7 problems on your own (without looking into solutions) before you appear for interviews. This exercise will make sure that you're able to apply the principles, patterns and product understanding to build a good low level design. I do not have a strong choice on the content but I'll [share this one](https://www.youtube.com/watch?v=rliSgjoOFTs&list=PL6W8uoQQ2c61X_9e6Net0WdYZidm7zooW) incase you want to get some idea on these problems.


## Diving deep

I've given multiple interviews for different companies and positions. So I'll share what is expected from each level:

1. **For Software Engineer/Sr. Software Engineer** - The focus is more on machine coding. So your performance in Data structures and Low level design is judged more than anything.

2. **For Staff/Principal/EM roles** - The focus is more on HLD (System design) and leadership qualities. Hands-on coding is evaluated less in comparison to HLD or in comparison to junior roles. You're just asked to share the schema design, API design, any challenging part of system that you need to discuss about.


As an example, I was asked to write code for LLD of the [Snake Game](https://github.com/gagan93jtg/lld-learning/tree/main/ruby/snakegame) in the Atlassian Interview process. As this was for a Senior Software Engineer role, the focus was on hands-on coding and they expected me to write completely working code within 45 minutes (plus some discussion around how I'd test this).

Whereas for Staff Engineer role, one of the LLD round did not involve coding at all. We majorly discussed the system entities (models), their relations, little bit on database design, API design and some specific parts of the system that sounded tricky (I call it the **core problem**). So it's very important to understand in the beginning what your evaluator is looking for. In most of the cases, the evaluator should clearly explain what they're looking for. But I've appeared for smaller companies also where this did not happen so I thought it is better to clarify rather than assuming. As a thumb rule, **never assume anything in an interview** (in any round). And if you do, share the same with your interviewer so that they can point out if that is a wrong assumption. Within a small period of 40-50 minutes, it's very costly to start with a wrong assumption and then correct it later.

I'll share a superset of what all things were asked from me in LLD round of different companies. Once the introductions are over, the interviewer gives you a problem statement. These are the things I take care of:

1. **Making notes**: I have a habit of taking down notes in all the technical interviews I give. I use a plain text editor window for the same (Sublime Text being my default choice for years). You could also use pen and paper but here the aim is that your interviewer should be able to read the same as you're writing. For the same, I also share my screen in the beginning. This helps me to scope down the problem statement before I start solving the specific parts.

2. **Figure out requirements** - So my first task would be to understand what all parts of system we want to build. Take anything real world - Uber, ZoomCar or BookMyShow (let's use **BMS**). You cannot discuss their complete product within 45 minutes. So it's better that you figure out with your interviewer what they are interested in. For example, in BMS problem, they might be interested in the **core booking problem**, rather than discussing kind of seats in a movie hall. Similarly, while discussing a cab booking platform like Uber, the core problem could be **driver allocation** and not the **inter city travel** feature. Think from a product perspective here. If you have used the app, then you must be knowing about the core features (and maybe the core problem also) but incase you have not used the app, tell the same so that you both can work together to scope down the problem. Once this is done, there are two scenarios - Either they'll ask you to write the code or not.

3. **Coding required** - Incase you need to write the code, start thinking about **core entities** (models), their **interactions**, **relation** with each other. Validate your understanding with the interviewer. If they're ok, start writing some code. Write the code in a top-down manner where you write the structure of everything first and leave some core algorithm implementation to a later time. Once the structure looks good, fill in the method implementations (based on available time).

4. **Coding not required** - Incase they have not stated the expectations, talk to them to understand if you should be writing some code or just talk about APIs, models, and some core problem. If you're not required to write a working code, you should still mention the **models** and **services** because they are a starting point of your database design. In this case, do talk about detailed **request and response formats**. Some interviewers want you to talk about REST APIs and see your understanding around the same, specially if you're working on a API based problem (there are non-web problems also, discussed later). While talking about APIs, do state your assumptions (if any). For example - I assume that there is an authentication mechanism in place already and auth information is being passed in the headers for each of the APIs we're discussing.

5. **Database schema** - Some interviewers can ask you to explicitly mention the specific tables and columns. In BMS, you'd have a **city** that has many **theaters**. Then a **theater** that has many **movie halls**. A hall can screen multiple **shows** during a day and has multiple **seats**. I hope you got an idea that highlighted words are our **Models**. So the interviewer would want you to write these tables, their columns (at least important ones) to see if you're designing the schema correctly. They can also ask you to write queries for specific APIs to see if your design can fulfil system requirements (eg. *Write a query to see if a Movie Show is completely sold out for a specific theater*).

6. **The core problem** - Different systems can have different core problems. For example, if you're designing an app like [Splitwise](https://github.com/gagan93jtg/lld-learning/tree/main/ruby/splitwise), your core problem could be settling the amount within a group of people. For Uber, finding drivers and showing ETA could be discussed. Here, the interviewer can expect a mix of things from algorithms to design patterns based on the specific problem. As you dig deeper into the problem, there are chances that you'll figure out the core problem. Otherwise your interviewer may also give you a hint like: *I want you to talk about this problem*.

7. **Test cases/scenarios** - One of expectations from a good developer is to figure out how can they test their code well. Incase you wrote code and have time left, you'll be asked to write some test cases. Otherwise you're expected to talk only around some test scenarios that you think are important. Nothing much to add here. If you know how to break your classes, follow design patterns and write test cases, that should suffice. If you think there is a part of problem in which some specific edge cases exist, do talk about it.


## Conclusion

So this is mostly what I've seen people asking during LLD interviews. One thing I'd like to add here - I saw three kinds of problems that are generally asked:

1. **Simple Games** based on some logic - Snakes game, snakes and ladders, Tic Tac Toe, Chess game, etc.

2. **Popular products** - Cab booking (Uber), Car renting (Zoom Car), some booking platform (BookMyShow), etc.

3. **Technical systems** - A rate limiter, Cache with LRU eviction, A PubSub System, Key-Value database, etc.


The different kinds of problems have their own complexity. For example, it could be easy for you to discuss an app that you use a lot (like Uber) than discussing a PubSub system. I'd suggest you to spend time practising all these kinds of problems so that you get an idea on complexity of each of them. Although the general approach (as discussed above) would remain the same. Happy learning 😊.

---

Thank you for reading this detailed post on Low Level Design. If you liked this, please have a look here also:

1. I created a small [github repo](https://github.com/gagan93jtg/lld-learning) that has solutions for four LLD problems in Ruby and Java languages. If you go to any of the problem, it will have a README that describes what we're building. You can take that README as a requirement to practice these problems. Refer my code only if you're stuck.

2. All my interview preparation/experience related posts are available [here](https://blog.gagan93.me/tag/interview).

3. I wrote a post last year about the [benefits of building small classes](https://blog.gagan93.me/classify-your-codebase), a practice I embraced years ago when I began refactoring systems.
