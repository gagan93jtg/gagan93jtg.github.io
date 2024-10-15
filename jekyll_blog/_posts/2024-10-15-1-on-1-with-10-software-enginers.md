---
layout: post
title: "1:1 conversations with 10 Software Engineers"
date: 2024-10-15
published_on: 15th October, 2024
author: Gagandeep Singh
cover: "/blog/assets/images/2024-10-15-one-on-one-with-engineers.jpg"
categories: generic-code refactoring solid
excerpt: This is a long blog post that captures some queries that people had in the 1:1 that I had with 10 engineers last month.
---

![cover-photo](/blog/assets/images/2024-10-15-one-on-one-with-engineers.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"}

Photo by <a href="https://unsplash.com/@dylanferreira?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Dylan Ferreira</a> on <a href="https://unsplash.com/photos/person-in-red-and-black-plaid-long-sleeve-shirt-using-black-laptop-computer-HJmxky8Fvmo?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

## Background

I’m always looking for ways to network with like-minded people. Last month, I [posted on LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7236405029618774016/) to connect with like minded people using a Google Form. I received about 10 responses! All the engineers were based out of India, except one from Switzerland. It was amazing to connect with them and learn about their work, challenges, and growth over the years. I even shared some cool stats from these calls in [another LinkedIn post](https://www.linkedin.com/feed/update/urn:li:activity:7243656624869949440/). I'm excited to connect with more people in the future and want to capture some highlights from these discussions in a blog post. Many of these calls included requests for guidance, and I'm eager to share my thoughts publicly to help even more people. If you wish to connect anytime in future, fill [this form](https://docs.google.com/forms/d/e/1FAIpQLScRLZv4vIHkOm68vmrTLw3KCnnQG1lOGkEkWNahphcKCt7HKg/viewform) and add me on [LinkedIn](https://www.linkedin.com/in/gagan93/).

## What all we discussed?

Most of the engineers had 4-7 years of experience and wanted advice on career growth along with potential future work and challenges. Here's what we talked about:

1. **Why am I doing this for free? Do I offer paid mentorship? -** Not everyone asked this but two separate people asked each of these questions.

2. **Interview preparation** - Half of them were either in their notice period or actively searching for new opportunities. I was able to provide detailed insights on this topic, having recently gone through a job transition myself. Additionally, I shared thoughts on various learning resources because all available content is not of good quality.

3. **How large teams work?** - Surprisingly, I’ve never worked in really large teams or organisations, but I’ve handled cross team collaborations and also read how teams operate in large companies. So I could give them some idea on this.

4. **How do I hire people?** - I’ve given interviews at about 6-8 companies before switching this time. But at LocoNav, I had interviewed &gt; 200 people for various engineering roles including Senior Engineers, Managers, QA engineers, Devops. So I shared some insights here based on my experience.

5. **Cultural differences between Indian and non-Indian teams**

6. **How do you handle/convey delays across layers of stakeholders?**

7. **Big Tech engineers are superior to us** - Someone had this in their mind, so had to discuss around this inferiority complex. Another guy had a question - *Why my friends in big tech companies get paid so much if they do same work as we do?*

8. **Growing as an Engineer, not a Java Engineer or Ruby Engineer** - It's important to be skilled in at least one language, but it's even more important to stay flexible and ready to learn anything new that comes your way.

9. **How to know about scale without working on scale**? - Not everyone gets a chance to work on scale or work on certain things like Devops, but many companies seek that experience. How to counter that?

10. **How I generally approach learning anything new?** - I was asked this question in an interview also. I’ll also share what I call as **continuous learning**.

11. **How often your managers sync and how does it impact your growth**? - I’ve been managed by all sorts of people — from those who didn’t sync in months to the current org where managers mostly sync weekly.

12. **How to know about team’s culture before joining?** - While salary details are clear before you join, it's tough to understand a company's culture until you start working there. However, there's a simple trick you can use to learn about the company before accepting an offer.

13. **How to be good at real world HLD?** - As I spoke with mid-level engineers aiming to become senior engineers, they were eager to learn about real-world system design. In many companies, you rarely get the chance to design large systems because high-level designs are costly to redo, and most people work on systems that are already designed. Despite this, it's crucial to understand core system design concepts so that even when making small changes to an existing design, you are aware of their implications.

14. **I’m not working on Kubernetes or Microservices, will I be easily able to switch? -** While I believe that it’s not important to get your hands dirty in every single hot technology to be relevant in the current market, you must remain updated with a few things. While micro-services or k8s is not something very new, many engineers don’t get to work


Let’s discuss about each of these one by one. This is going to be one a long blog post because it’s summary of more than 13 hours of discussion. If you find this really long or parts of it not relevant to you, feel free to read specific parts using table of contents on the top.

## **Why am I doing this for free? Do I offer paid mentorship?**

Many engineers, especially those at Big Tech companies, offer paid mentorships through platforms like Topmate, charging varying fees. While having a second income is fine, I've received help throughout my 9-year career without being charged. It doesn't feel right to start charging for sharing the same knowledge. My religious beliefs also motivate me to offer help for free. I've encouraged others to help for free whenever possible. My job pays well, so I don't want to charge for an hour of conversation. Additionally, not all calls are about mentorship; some people just want honest chats about work, experiences, productivity, team culture, and more. As of now, I don't plan to offer paid mentorship services. Feel free to message me on LinkedIn if there's anything I can help with.

## Interview Preparation

As half of the engineers were in their notice period, this was a pretty common question — How to prepare for interviews and what all things to study. I’ve already written in detail about my [interview experiences](https://blog.gagan93.me/tag/interview), [resume improvement journey](https://blog.gagan93.me/improving-your-resume), [low level design interviews](https://blog.gagan93.me/low-level-design-interviews) and [job titles](https://blog.gagan93.me/titles-inflation-and-down-levelling) on my blog. I'll still share more based on their specific questions.

1. **Learn about different companies** **and target accordingly** - Talking specifically about engineering roles, there are different types of companies like services companies, consultant companies, early/mid-age startups (Seed/Series-A/Series-B), Scale-ups (Series C+, post IPO), and Big-Tech companies. To explain a bit about each of them:

    1. **Services companies** typically include (but not limited to) Infosys, TCS, Accenture, Cognizant etc.

    2. **Consultant** ones could include [MBB](https://en.wikipedia.org/wiki/Big_Three_\(management_consultancies\)), Thoughtworks, etc. Similar to the first one, you are working for others (not on your own products) but the role consultant-based where you completely handles client, not just code.

    3. **Early/mid age startups** could include any company that is going 0-1 (building MVP) or 1-10 (secured some funding and building for real customers). People in such companies are expected to be **generalists**, who can wear multiple hats and can get work done really fast.

    4. **Scale ups** could include post IPO companies like Zomato, Paytm, Delhivery, and similar companies. I could categorize them as young, agile, fast-moving but having lot of governance and processes because of being a public entity.

    5. **Big Tech** (as you’d expect) includes FAANG, and similar sized companies like Atlassian, Uber, Stripe etc. I’d call any other company as BigTech if they have &gt;1000 engineers. In comparison to any other kind of company, here you’d find a lot of internal tooling.

        There's a trend of people moving from services companies and startups to Big Tech companies, but I've also seen people move from startups to other startups or from Big Tech to startups. For example, I started at a services company (not as big as the ones mentioned) and then moved to startups. So I’d recommend you to decide types of companies you want to target and prepare for them accordingly. There are many websites, videos, and interview experience blogs that explain the interview processes for each of these.

2. **Process familiarity** - All companies have their own process for selecting candidates. While common rounds like DSA, LLD, HLD, and HM exist in most companies, always get the details from your recruiter. If you're interviewing with a large company, the recruiter will likely give you a document explaining the process with resources to help you prepare. In smaller companies, you often need to ask questions to get clarifications. I've met engineers who didn't know the total number of rounds because the recruiter didn't explain, and they didn't ask. You must ask these questions to understand what is expected in each round so you can prepare accordingly.

3. **Resources** **for preparation** - A lot of my work over the past 2-3 years has focused on refactoring and migrating systems, which has improved my low-level design skills. One way to prepare is by taking on similar work in your current role to naturally enhance your design skills. However, this approach doesn't work for DSA and HLD rounds. That's why I view the LLD round differently from the DSA/HLD rounds. Generally, people in roles like SE, SSE, or Staff, who are individual contributors, are involved in building or maintaining systems, writing, and deleting a lot of code. Engaging in similar work will automatically improve your low-level design skills as you create and refine system designs. On the other hand, most of us don't use the advanced data structures that are tested in interviews, making DSA a topic specifically for interview preparation. Similarly, few engineers get the opportunity to build or modify high-level designs, so they don't improve practically in System Design. Working at an early-stage startup in my last role gave me a solid understanding of cloud and system design, which many engineers don't get. To succeed in these rounds, I recommend spending a few weeks or months (depending on your current skills and preparation time) to master the basics of these areas:

    1. **Resume building** - **Please please please** spend time in building and continuously improving your resume. Eliminate all spelling mistakes, punctuation errors, and any other beginner mistakes. For a detailed overview on how I did it, read [this blog](https://blog.gagan93.me/improving-your-resume).

    2. **DSA** - Leetcode helped me improve my DSA skills, but for my role (Senior/Staff) the questions were mostly easy-medium level. Based on your level and companies you’re targeting, you might be asked a combination of easy/medium/hard questions, so prepare accordingly.

    3. **LLD** - I studied from multiple youtube channels and solved some problems in Ruby and Java (available [here](https://github.com/gagan93jtg/lld-learning)) so that I can solve them on a decent speed during the interview. I did not spend a single penny on a paid resource for LLD. If you want to know more about different kinds of LLD interviews I gave, I’ve written a [detailed blog](https://blog.gagan93.me/low-level-design-interviews) on it already. Feel free to check it out.

    4. **HLD** - I was skeptical on my HLD skills so I took a paid course but that was badly structured. It was enough to confuse any beginner but having a good idea of those concepts already, I was able to navigate through it and complete about 70% of it before giving interviews. Later, someone told me about Educative.io and it looked much better organised. I’m not pushing you to use the same resource because of a few reasons. First of all, it’s a paid course and I do not promote anything paid on my blogs. Secondly, it’s a text based course while most of the other courses are video based. I’m fond of reading so I purchased it, you may not like it if you’re not into reading. And third, their well-known system design course (Grokking) is very long. So I’d recommend this only if you want to learn the concepts beyond interviews and the course falls within your budget. Although I don’t endorse it, I can vouch for the quality of content.

    5. **Behavioural / Hiring manager** - Watch some free youtube videos to understand the structure of this round and what people generally ask. Beyond that, just be true to yourself and be good at communicating your thoughts. You might struggle here if you’re not an efficient communicator.

4. **Where to apply? -** There are plenty of websites could help you. Again, I didn’t spend anything for my job search but these are the websites I used - LinkedIn jobs (set relevant job alerts), Tophire (I got Branch’s offer through them), Bigshyft (I still get calls from them 😂), Instahyre (Atlassian reached out through this) and Hirist. I also registered on Indeed and Naukri but never got relevant openings through them. You can find and register on more platforms but at least register yourself on these.

    I hope this helps for interview preparation. Moving on to the next topic 😎.


## How large teams work?

Let me add more context to this question — This was asked by someone who was working for a startup for about 4 years, and was wondering how things would unfold if their team scaled 2x-3x in strength. How would the projects be managed and what challenges would exist for them being an old member of the team who is transitioning more towards a managerial role. This is a common question for people working in small teams. They sometimes wonder how large teams operate to make something as large as Youtube, Google Maps, or Amazon S3.

Having worked for startups mostly, this question was slightly out of syllabus for me 🤣. But I’ve read about large organisations and how they work, so I could add some insights.

1. First of all, no large system is built in a day, or week, or even a month. Smart engineers start building things in the most stupid way, and iterate on them as they find bottlenecks in the system that prevents it from scaling further, so that they can replace those specific parts of the system. I remember my last company’s co-founder (who was also a Ruby engineer) using a hacky way for partitioning tables in Postgres 9.3. If you’ve used that version of Postgres vs Postgres 12+, you’d know that the current partitioning features didn’t even exist in that version. But at that time we didn’t have enough choices because we were pretty early stage and had limited exposure to good tech. Once it was no more scalable for us (at 38TB single Postgres database, when the cost was really huge), the team handling that system redesigned the same into a separate data layer that used a suitable technologies. It’s very important to start stupid initially and satisfy the business needs so that you can sell whatever you made. For example, it would be hard to assume that YouTube used MySQL to begin with, and they made it work till a [massive scale](https://www.reddit.com/r/programming/comments/1d4u12d/how_youtube_was_able_to_support_249_billion_users/).

2. Having large systems doesn’t mean that you have really large teams that run them in a monolith fashion. For example, Amazon’s [two pizza rule](https://aws.amazon.com/executive-insights/content/amazon-two-pizza-team/) is very popular in the software industry that says — *No team should be big enough that it would take more than two pizzas to feed them*. *Ideally, this is a team of less than 10 people: smaller teams minimize lines of communication and decrease overhead of bureaucracy and decision-making.* Also, because we’re talking about large teams and about Amazon, [this article](https://highscalability.com/behind-aws-s3s-massive-scale/) is a great reference. The most popular blob storage service, Amazon S3 alone is composed of more than 300 micro-services, and you cannot assume all the teams building them to come in a one giant standup thrice a week to talk about their work. It’s obvious that a lot of engineers and managers would be managing these services so that they can focus on specific areas. At the same time, it’s very easy to talk about good engineering management at that scale, than doing it efficiently. So I always appreciate how these large organisations remain agile and build massive applications for their customers.

3. If your company is building really large systems, they also invest in building Internal tools so that developers in different teams follow same standards and do not reinvent the wheel for solving similar problems. In my previous role, I’ve worked in the developer productivity team for more than one year. As our team was scaling in strength and developers were breaking the system into microservices, we were building internal tools for configuration management and deployment so that we could easily deploy the applications to EC2 machines, dockers or kubernetes. We were required to support multiple deployment systems because we had not transitioned fully to kubernetes and different applications (both old and new) were getting deployed to different platforms.

4. Not all the processes of large organisations make sense for small organisations, or for those organisations that are scaling to a larger one but I’d like to emphasize on one very important rule that impacts the success of projects — [Amazon’s Single threaded leadership principle](https://daily.stoa.com/newsletter/single-threaded-leadership). In startups, we generally don’t hire people as new initiatives begin. As a result, same set of people are juggling (and sometimes struggling) with multiple initiatives. If there are some gaps in the quality of delivered products, it’s acceptable to the leadership because they know that people are trying their best. With teams scaling to a larger strength, it is important to revisit this culture. If it is not acceptable going forward, it’s important to improve the team’s culture in a way where people are not overwhelmed with projects and whatever they deliver is of much better quality. The **Single Threaded Leadership** **Principle** might make some sense for the scaling organisation because at a specific point, teams might be catering enterprise clients where quality is very important.


## **How do I hire people**

I’ve been contributing to hiring efforts from my second year as a Software Engineer, where I use to take DSA round. I’ve taken hundreds of interviews since that time, which include the same for Engineers (junior / senior / lead), Managers, QAs and Devops. I personally believe that it’s very important to understand the candidate and their aspirations, rather than just throwing a problem in front of them and talking about it for an hour. Interviews of a candidate should happen in a way where each interview helps you to paint a clearer picture of their behaviour and skills rather than every round starting with the old “please introduce yourself” question. To hire anyone in future, I’d look for these things:

1. **Technical excellence** - If it’s a hands-on technical role, it’s very important to ensure that the candidate understands code and should be fluently coding in one language of their choice. I always focus on the basics rather than evaluating someone on a fancy leetcode problem. As an example — while interviewing Devops people, my favorite interview question use to be *“You’re trying to SSH to a machine but the command is unresponsive unless you cancel it. How would you debug this?”.* I want to see how people respond to such basic questions —What clarifications do they take on this small question? Do they talk about network barriers like security groups or VPC route tables? Do they consider the fact that if the authentication key is wrong, then you immediately get an error rather than having a hung connection. I appreciate good debugging skills.

2. **Ability to break a problem** - You could learn about this while evaluating design rounds, or when they explain some of their projects. IMO, if someone can break problems into parts, they can work on things incrementally rather than doing big-bang releases/refactors. Also, these people estimate projects better than those who do not understand the [power of small changes](https://blog.gagan93.me/classify-your-codebase). This is an under-rated technical skill.

3. **Programming language agnostic** - I’ve done one wrong hiring in the past where the candidate was too much tied with Spring boot framework (not just Java). They told about the same after joining but I was not managing projects that were Java based. In the end I had to move them in some other team because the other option was to let them go. As a learning, I’d not expect a person to be [polyglot](https://www.techtarget.com/searchsoftwarequality/definition/polyglot-programming) already, but open enough to work in any language.

4. **Quality of work -** When evaluating their solution in any round, check if their solution meets the ask of the problem statement. How well do they handle the edge cases? Do they ask enough clarifications where required (or they just assumed those)?

5. **Getting things done -** While quality of work matters, I’ve seen people getting stuck on small things and not having enough bias for action. Having worked in startups, I think this is something I’d look for all kinds of roles. If you’re a good engineer who writes optimised code but do you not push the barriers that come your way, you might not be able to release something real that gets used by the customers.

6. **Cultural aspects** - In small organizations, while we may not conduct formal behavioral interviews, all interviewers are vigilant about observing a candidate's behavior throughout the interview process. This careful observation is crucial to ensure that we do not end up hiring someone who might not be a good fit for the team. From my experience, I have witnessed the consequences of hiring the wrong person, ranging from fresh graduates to Heads of Engineering (HOEs). Depending on their role and influence within the team, a poor hiring decision can lead to significant negative impacts, even within a short timeframe.


To summarize:

1. Good basics + great debugging skills.

2. Ability to break problems and some past experience working on quality projects.

3. Bias for action, humble and eager to learn.


## **Cultural differences between Indian and non-Indian teams**

I think all of you have heard of a few cases in the recent past where employees died at work or committed suicide due to work pressure. It’s very unfortunate to see the same companies having great working culture outside India and highly toxic culture in India. I wrote about [blameless culture](https://blog.gagan93.me/blameless-culture) recently where I shared some examples of how good or bad culture propagates from the top to bottom, or from old employees to new employees. It all boils down to a few people on the top that we call as **the leadership.** These people define:

1. Code values and principles.

2. Quality of work.

3. Communication Style.

4. Response to mistakes / failures.

5. And most importantly - Work life balance.For me, the 16-hour workday philosophy is nonsense. If I don't have time to think about other things in life, I can't grow personally or professionally. I've worked with US teams in my first organization, and now I work with both US and Africa teams (in addition to the India team). Fortunately, the overall culture encourages taking leave whenever needed, whether for a personal emergency, rest, or vacation. People in the US don't work beyond a certain limit, but that doesn't mean they haven't created good products or scaled companies.


In a nutshell,

1. Do not over-work regularly. Doing the same for a few days should be fine based on the business needs and your physical/mental health.

2. If you or your team overworks everyday, figure out what could be wrong (some ideas [here](https://blog.gagan93.me/eight-productive-hours) and [here](https://blog.gagan93.me/efficient-fullstack-delivery) for engineering teams).

3. Do not value any work or opportunity above your health or family.

4. Fix the company culture if something is wrong. If the leaders do not support you, find a new job.

5. Take your work seriously. In the 8-9 hrs you put, give your 100%.


## **How do you handle/convey delays across layers of stakeholders?**

Let's consider this hierarchy: developers (including you) → project manager → business teams → customer. Anyone who has successfully launched a product knows that initial estimates are often inaccurate. The accuracy of your estimates depends on many factors, such as:

1. How **undefined** is the problem? - Do we need to check if it's feasible? Are there dependencies on other teams?

2. How much **experience** does our team have in building something like this? - This includes the experience of senior engineers, product managers, and designers.

3. How well did we **break down the problem** while estimating? - If you break it down well, you'll likely complete half of the software design, and your estimates will be closer to accurate.

4. How **new** is the team? - If there are many new members, there is a possibility of inaccurately estimating their speed in developing production-ready systems.


Beyond this, each layer should understand that the previous layers might exceed their estimates, so they should include their own buffers. For example, if developers estimate 6 weeks, managers should say 7-8 weeks, and the business team should tell the end customer 8-10 weeks. It's okay to *under-commit and over-deliver* (but not the reverse).

If your team can follow this kind of framework, it‘s great. Because then you don’t need to do the hard part of convincing the customer who was waiting for a feature. I’d like to add one point for the managers — Your team could be bad at estimating something. But that doesn’t mean that you give your own estimates to the business team. A non-engineer should never estimate on behalf of engineers. If you think their estimates are wrong everytime, sit with them and retrospect.

## **Big Tech engineers are superior to us**

I respect great engineers and managers who have built really large systems without which the world would have been very different. At the same time, do not think that they are of a different breed. I think engineers in startups typically work in environments with fewer resources, less structure, and more uncertainty. They wear multiple hats, tackling everything from backend to frontend, cloud and even take product decisions. This exposure forces them to develop a holistic understanding of technology and the business. In contrast, engineers at Big Tech firms may specialize in a narrow domain within a larger system, where their role and responsibilities are more clearly defined. While specialization can lead to deep expertise in specific areas, it may also mean less exposure to the end-to-end development process, product strategy, or direct customer interaction.

The perception of Big Tech engineers being superior is often tied to the prestige of working at a well-known company and the assumption that these engineers have passed rigorous technical interviews. Another key difference is the sense of ownership and impact. In startups, engineers are closer to the product and customers. The features they build, the bugs they fix, and the architectural decisions they make have a direct influence on the company's trajectory. This proximity to the business side creates a different kind of pressure but also provides unique learning opportunities that many Big Tech engineers may not experience. Ultimately, the skills and experiences gained in startups can be just as valuable as those acquired in Big Tech. Both environments have their strengths, and neither is inherently superior to the other. So the engineers in startups shouldn’t view themselves as "inferior" simply because they don't work for a large company.

On the other hand, big tech companies manage vast products, extensive business operations, and significant overall revenue. In such environments, even small optimizations made by engineers can lead to substantial financial benefits. For instance, a minor improvement in code efficiency or system performance can save millions of dollars due to the scale at which these companies operate. Therefore, it's important not to assume that engineers in big tech are performing the same tasks as those working on an app serving only 1,000 users. The scale, complexity, and potential impact of their work are vastly different. Engineers in big tech often deal with challenges related to scalability, security, and global user bases, which require a different set of skills and approaches compared to those needed in smaller-scale applications.

## **Growing as an Engineer, not a Java Engineer or Ruby Engineer**

I’ve been fortunate to be mentored by someone who was a polyglot programmer. Although I’ve majorly written only Ruby in production throughout my career, I’m mentally aligned to think about problems without tying them with language specific constructs. Knowing multiple languages help you to apply good things of one language in another language and build something in a unique way. With this knowledge, you can also plan to build certain parts of a system in a different language that is more optimised for the use case, especially when you get a chance to split them into services.

In many of these discussions that I had with these engineers, I told them to start thinking of solving problems without talking about the language. Also, whenever given a chance, do not shy away from learning a new programming language. The maturity that comes with this mindset also helps you to write build documentations where you use more generic / industry standard terms rather than using the names of specific libraries that were used to implement the same (eg. calling part of system as **background job processor** rather than [celery](https://github.com/celery/celery), [jobrunnr](https://www.jobrunr.io/en/) or [sidekiq](https://github.com/sidekiq/sidekiq/)).

## **How to know about scale without working on scale**?

This question came from someone who was asked about database query optimisation in an interview. While they knew about indexes and a few other things that help you optimise queries, they had never done something like this in the past. I think there are two ways to learn about scale:

1. Build something (in a company or as a personal project) that scales to millions of users.

2. Or, see how others did it.


By "others," I mean learning from the experiences and mistakes of other people. Almost all large tech companies have blogs where they publish case studies, failure stories, and success stories. In addition, there are independent bloggers who write about their experiences in building and debugging large systems. Subscribe to some of these blogs, and you'll notice a difference in your knowledge in the next three months.

If you’re not sure where to start from, I’ll give you some ideas:

1. Think of the big tech companies that your admire (examples - [Github](https://github.blog/engineering/), [Shopify](https://engineering.atspotify.com/), [Stripe](https://stripe.com/blog/engineering), [Instagram](https://instagram-engineering.com/), [Slack](https://slack.engineering/)).

2. Follow some good substack newsletters. I really like [Pragmatic engineer’s](https://www.pragmaticengineer.com/) newsletter (although a lot of content is paid).

3. A lot of people reading this might already be familiar with [Arpit’s youtube](https://www.youtube.com/@AsliEngineering) channel. I really admire the quality of this content.

4. You could consider subscribing to [my blog](https://blog.gagan93.me/newsletter) if you find the content good enough 🫣.


## **How I generally approach learning anything new?**

There are generally two kinds of things that anyone is learning:

1. If you’re learning something to quickly build a prototype where you do not care about quality, use any source to learn. It could be a 10 minute youtube video, or a brief documentation, or ChatGPT prompts, that help you write some code, or understand a few basic concepts about a new technology.

2. If you’re serious about learning that topic, still follow step 1 so that you build some interest and then **learn from a book**. I’m old an school guy here, who would prefer books over videos. I think these days, anyone can put their camera on a tripod stand to record a video after a little bit of research. Here the quality of content might be good, average, or bad. But if you’re picking a book of a good publisher, the chances of getting a good quality content are much higher. This is my own theory, feel free to disagree 😂.


I learnt docker back in 2022 using this method. Earlier I just created a Dockerfile for one microservice that I was building. It wasn’t optimised at all (I copied it from somewhere). Later I read [DIAMOL](https://www.manning.com/books/learn-docker-in-a-month-of-lunches) to get a deeper understanding of Docker, after which I did a lot of optimisations in different Dockerfiles and wrote this [detailed article](https://blog.gagan93.me/optimising-docker-builds) to help the community.

**Continuous learning** - Your work might be very challenging, but it can still limit your learning to certain areas. Make sure to set aside some time regularly (weekly or monthly, if not daily) for learning. I understand that not every day is the same. Some days are more stressful, while others are more relaxed. Create a list of blogs you want to read or videos you want to watch, and learn from them whenever you have some free time.

## **How often your managers sync and how does it impact your growth**?

In my first organization, there was no formal manager hierarchy in my team. We all reported to one of the three founders. Our project was in maintenance mode, so we didn't have a senior resource like a Tech Lead assigned, as they were in other teams. I wouldn't say my growth was halted because of this, but now that I have managers who sync weekly, I see the benefits of regular manager check-ins. Many people in these calls mentioned their managers don't sync with them regularly. Here, *regular* doesn't mean weekly but rather on a fixed schedule. This depends on factors like:

1. The company culture might not encourage managers to have regular meetings with all their direct reports.

2. Your manager might be on a technical role like tech lead and not a “manager-only” role where they have a tight schedule with their own deliverables.

3. You might be part of a fast-paced team where these meetings aren't prioritized because delivering products is the main focus. The team may be learning a lot during this process, but that doesn't ensure your goals align with the company's goals.


In my previous role, I met with my manager once every 2-3 months, and I was managing a team of 7 people myself. Since I hadn't experienced regular meetings with my managers before and wondered, "What would we even discuss every week?" I didn't schedule regular meetings with my team. Instead, I told them to reach out to me at least once a month if they felt the need. In my current role, all managers meet with their direct reports weekly. They discuss everything from professional to personal topics to help you feel comfortable and aligned for growth. In short, managers should set up regular meetings (weekly, every two weeks, or at most monthly) to ensure that:

1. Their direct reports do not feel disconnected from them, especially in a remote setup. A strong connection is important to ensure that employees are motivated and feel comfortable enough to give feedback for the team's overall improvement.

2. If there are performance issues or expectation gaps, they should be addressed early, rather than during the appraisal cycle. This ensures you have enough time to fix those gaps promptly.

3. Your career goals are aligned with the company's goals.

4. These meetings can also cover topics beyond work, like how you are planning an extended weekend or how everyone is doing at home. After all, a healthy team is like a family :)


## **How do I know about team’s culture before joining?**

A strong team culture fosters productivity by creating a supportive environment, while a toxic culture can decrease morale, leading to disengagement, lack of collaboration, and ultimately, low productivity. More than compensation, culture is crucial, yet many people overlook it before joining a company. If you've only experienced companies with good culture, you might not recognize bad culture till you get to see it first-hand. It's important to know:

1. If the team engages in productive meetings or they just setup long meaningless meetings with a lot of folks. Do meetings have agenda and end with either action items or followup meetings?

2. How is failure handled? Does the team engage in blame game or fixes the root cause and learns from it?

3. How do people generally feel about the product they’re working on? Are they proud of it?

4. Do people encourage sharing feedbacks openly or does everyone think “they’re right”?


At this point, you might be thinking — how do I know about these things before joining? It’s not that hard. I’d do all this to confirm the same:

1. During your interviews, pay attention to how organized and punctual the interviewers are. Notice their communication style, how they evaluate your solutions, and the feedback they provide. A big red flag for me in design rounds is when people have fixed solutions in mind and **force** you to change your design to match theirs. Such people won't let you innovate even after you join the team.

2. Check online reviews on some websites to get a sense of the company. Remember, some reviews can be biased, so this should **not be the only thing** you consider.

3. Talk to current or former employees to see how they feel about their work. Ask specific questions (like those listed above) instead of just asking, "How do you feel working at &lt;company\_name&gt;?" Make sure you [ask good questions](https://blog.gagan93.me/asking-good-questions). If they're unhappy, they likely won't want someone else to join and be unhappy too. To get a better idea, talk to at least two people.

4. In discussions with your recruiter or hiring manager, ask about work-life balance, leadership principles, and other factors that affect productivity. Compare their responses to what employees have shared about their experiences.


## **How to be good at real world HLD?**

This response overlaps with “*How to know scale without working at scale?*”. You don’t easily get the chance to build something large or join a team scaling their systems. The best thing you can do without much investment is to learn from others' designs and mistakes.

1. IIf you work for a company with large systems, talk to the people who built them or have been working on them for a long time. Read documentation to understand design decisions and how they've evolved. Look for [ADR](https://github.com/joelparkerhenderson/architecture-decision-record) documents in large companies to learn the reasons behind these decisions.

2. If you're on a small team with scaling products, it's a great opportunity to learn how to optimize the system for scaling without overspending. Understand how indexes speed up queries and which types you need. Learn about caching and cache invalidation (the [second hardest thing in computer science](https://martinfowler.com/bliki/TwoHardThings.html)). Learn how you can write modular code to make future changes easier.

3. If you're on a team with unstable products, find out what causes outages and read past outage postmortems. You'll learn more from outage calls than from regular work. Don't miss this learning opportunity (I've also shared my insights from [debugging production outages](https://blog.gagan93.me/debugging-production-downtimes) here).

4. If none of these apply to you, learn from others through newsletters, blogs, and videos that explain these concepts.


Being good at HLD is not building scalable systems on day 1, but starting with a stupid solution and innovating on the go. And in this process, you should know (or learn) what part of systems can potentially be a bottleneck so that you plan your changes accordingly.

## **I’m not working on Kubernetes or Microservices, will I be easily able to switch?**

No system needs micro-services architecture, an EKS cluster or Kafka to begin with. Even when they acquire real customers, they still might not need these technologies. Mature technical leaders know the challenge of introducing fancy parts in the infrastructure, and they make sure that you do not have them unless you can pay for the operational cost of running and maintaining them. It’s easy to spin a Redis cluster, an EKS cluster or even an API gateway with a few clicks on your favourite cloud provider. But it’s not easy to get away with these technologies once you’re in. For example, an EKS cluster has a starting cost of ~ $70-$80. In a similar cost, you can launch 2 small EC2 machines behind an Application loan balancer along with a small RDS. While EKS solves for your “scaling needs”, you don’t need to solve them on day 1. I remember my last company was running a single EC2 server that was also running background jobs in a 4 core, 16G machine when I joined in 2018. It worked pretty well for them at that time and we didn’t introduce an ALB till late 2018 because that has a fixed monthly cost + data transfer cost that no one wants to pay from the first day.

This question came from someone who had 5+ YOE experience but no experience working on microservices. My suggestion here is that you should read about microservices and when it’s good to have them in your system. I’ve worked on transitioning monolith to microservices after reading [this book](https://www.amazon.in/Monolith-Microservices-Sam-Newman/dp/1492047848), and trust me that it’s not everyone’s cup of tea. You need a dedicated team to work on it rather than a few engineers working on it part-time. Even then, there are high chances that you end up building a more convoluted architecture (some thoughts shared [here](https://blog.gagan93.me/monolith-microservices)). For you as an engineer, it’s important to know all the challenges so that whenever you get a chance to do such a migration, your chances of being successful are high.

Working on distributed systems isn't something everyone gets to do, but it's important to understand their pros and cons. This way, future interviewers can assess your knowledge, and you won't appear uninformed about these systems. So be it microservices, kubernetes or containers — know little bit about everything even when you don’t get to work on them in production.

---

## Conclusion

Thank you for taking the time to read through this post. I hope the insights were worth the time you spent. Hearing firsthand about the diverse challenges, growth experiences, and problem-solving approaches was a reminder of how valuable open dialogue is for learning and professional development. Whether you’re navigating similar paths or different ones, I hope these reflections offer useful perspectives. Do share this with your friends who are looking for similar advice. Let me know your thoughts in the comments. See you in the next blog post 🚀.
