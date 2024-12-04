---
layout: post
title: "Stripe Interview Experience"
date: 2024-05-07
published_on: 7th May, 2024
author: Gagandeep Singh
image: "/assets/images/2024-05-07-stripe-interview-experience.jpg"
categories: stripe interview staff-software-engineer
tag: featured
excerpt: I interviewed for the position of Staff Software Engineer at Stripe in December 2023. They were hiring engineers in the Verification & Identity Platform team.
---

Photo from <a href="https://www.google.com/search?sca_esv=87522dea2824ff52&sca_upv=1&sxsrf=ADLYWILkvvPEaLSLta0vbUlLLiSxs0BWaw:1715080024675&q=stripe&uds=ADvngMjTNPKEE-q7I44lun7GC2_xSBJakMDKk-zKP558UX3sGFgOo0obkT031nY191A6wYa4TKscNMz9nP09qudeXs6qjCVIMuAYWsNeUj1s-4H7nT9Qe8VwqZDmCXUj1j6FA1u2k2VYrDv3nso5ytnOUTS-I_q57ncjE0lSWYQOUjGzhq2Q6jSJwajnI5-4O-5SG-GId7Ebxmrab0S7tl0xBLhPcrufYwvgG_qRMVkigo81MJHwaHwu31KwhIxtySTCHOFpjrTG_mwsclx4pnuJ8YDWgoKJb-w717k6A5s5toPiq-guPtM&udm=2&prmd=isvnmbtz&sa=X&ved=2ahUKEwi0_Ib9svuFAxWybmwGHTv9D0QQtKgLegQIDBAB&biw=1496&bih=812&dpr=2#vhid=LKToaxY8zwIc8M&vssid=mosaic">Stripe Engineering</a>
{: style="text-align: center;font-size: 0.8em"}


## Background

I interviewed for the position of **Staff Software Engineer** at **Stripe** in **December 2023**. They were hiring engineers in the **Verification & Identity Platform team**. I applied through a referral as that increases your chances of getting shortlisted. For those who haven't heard much about Stripe:

1. It is one of the big players in [global payment products](https://docs.stripe.com/products).

2. In the past, Stripe has been known to be the [largest Ruby codebase](https://www.linkedin.com/posts/gergelyorosz_stripe-softwareengineering-activity-7140426202174967808-xDQE/) in the world. They used Sinatra (not Rails) for web apps, so they're not the largest Rails codebase (which [Shopify is](https://shopify.engineering/shopify-monolith#:~:text=Our%20main%20monolith%20is%20one,of%20developers%20currently%20adding%20features.)).

3. They have a wide tech stack now but their founder explains [why they used Ruby](https://www.quora.com/Why-did-Stripe-choose-to-use-Ruby-for-its-backend-language) to start with. Stripe also has a very [popular technical blog](https://stripe.com/blog/engineering).


**Note**: Stripe asks the candidates to sign a [NDA](https://news.ycombinator.com/item?id=1952848) because of which I cannot share the exact interview questions but I'll still share the format of interview and difficulty of questions to some extent.

## Interview rounds

1. **Telephonic round with Recruiting team** - This was scheduled to understand my role, projects, career goals and set up alignment with the role. The recruiter was based out of Singapore and was taking care of APAC hiring. Although they were not technical, they were expert in explaining the job description and were clearly able to point out things that I was not doing right now in my job role (that they needed for the role). For example, I work as a Staff Engineer at LocoNav which is a small team. So here, my role doesn't involve regularly setting up technical direction for the team but considering Stripe's scale, Staff Engineers are very senior in role and they take care of the same on regular basis. So, they told me before hand that based on my performance, I might be **down-levelled** if they see a need to do this. This could sound discouraging as the position below **Staff Engineer** was of **Software Engineer** but they explained that engineers with the experience range of 0-15 years of experience do fall under this role. This is so because Staff Engineers are very senior in Stripe and they do not have a middle role (i.e. Senior Software Engineer).
    On a side note, I wrote about [titles and down-levelling](https://blog.gagan93.me/titles-inflation-and-down-levelling) incase you want to understand when it is good or bad for you. Additionally, although the JD mentioned the location as **Remote**, the recruiter clarified that they're planning to start WFO soon (early 2024) so the location would be Hyderabad/Bangalore.

2. **System Design Round** - Staff Engineers at Stripe typically go through **two** System Design rounds. In each round, there is a Staff Engineer who evaluates your design. In this round, the interviewer was from a different timezone and a very senior person (~10 years senior to me). They explained the problem statement and waited for me to probe for details. While many companies ask for the design of well-known large systems (eg. Youtube, Whatsapp, Google Drive, etc), Stripe is known to ask questions around their own systems only. So the question was related to payments product. This was first ever System Design Interview that I was giving in my career, so I was skeptical on my approach. The problem statement seemed very simple and I queried 2-3 times (like "is *this is what I have to build?").* At that time, I was not familiar with the fact that simple problems can also be asked for senior roles, but the expectation of solution is with respect to candidate's expertise/seniority. Just to explain this more - You might have heard that some companies (like Atlassian) have High level design (or System Design) round even for hiring college freshers. At their level, the expectation is that they should understand basic building blocks of the overall system and have some idea on non-functional requirements. The same problem statement can be given to a Senior Engineer where the expectations will be very different. The interviewer can probe into specifics of protocols, choice of databases and so on. For Staff/Principal/Distinguished levels, the discussion can go towards privacy, compliance, regional failovers, disaster recovery etc. I started attempting the question and explained the components of the system and some APIs. I missed one thing around scale of data that the interviewer pointed out. At this point, I realised that exposing an API endpoint is not a good idea and we should have a queueing mechanism like Kafka in between for improved reliability at scale (eg. if consumer system crashes, it can retry from where it left on the Topic).
    Because this was my first ever System Design interview, I was a bit confused during my attempt and the interviewer sensed that. They shared the feedback with the recruiting team that I'm a good candidate but probably I should be considered for a lower level (i.e. Software Engineer). The same was conveyed to me and I agreed to be evaluated again for SE role. The interview process restarted.

3. **Coding round** - As per the documents shared with me, Stripe's interview format claims to be very different than big tech companies as they have rounds where you engage more with the interviewer to solve problems and debug issues. For example, their interview process mentions some rounds where you have a codebase ready in which you implement a specific functionality or solve a bug that they've intentionally added. Surprisingly, this round was nothing like that and I was presented with a typical data structures problem 😶. It was a simple problem, again related to their products (i.e. payments). I asked my doubts and implemented the solution that worked. The interviewer modified the problem statement and asked me to accommodate the same in my solution. This one took some time but I was still able to solve it. With this, the interview came to an end and he asked me if I have questions. I asked how many more variations exist in the problem, to which he said "total of five". After the interview, I searched for the problem and found that this question was a typical Google's telephonic interview round question (not one "related to their products") 😲.


After a few days, I was informed through email that I did not clear the round. I thought - maybe I was expected to solve more variations of the problem within the given time because my solution was working for the given cases. As usual, I thought I'd reach out to the recruiter to seek the exact feedback but couldn't do so because they were on new year vacation. They asked me to schedule a slot on their calendar that never loaded on my browser. Even today if I open the link, it keeps loading like this:

![scheduler](/blog/assets/images/2024-05-07-stripe-goodtime.jpg)

LOL. Not blaming it on them. They might have responded if I had mailed them back with the loading issue, but I lost touch due to their vacations and never contacted them again.

## Conclusion

It was a good experience with Stripe team. The recruiter was responsive on call/chat/email throughout and ensured timely response. I like their [culture of writing](https://newsletter.pragmaticengineer.com/p/stripe-part-2) that [starts from their CTO](https://www.linkedin.com/posts/gagan93_culture-writing-team-activity-7170322475212374016-UjEc?utm_source=share&utm_medium=member_desktop) - something that everyone should do (if they can). I would have performed better in System Design Interview if this was not my first ever HLD interview but no regrets. Failures are integral to the journey of success 📈.
