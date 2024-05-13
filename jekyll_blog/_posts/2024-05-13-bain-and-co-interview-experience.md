---
layout: post
title: "Bain and Co. Interview Experience"
date: 2024-05-13
published_on: 13th May, 2024
author: Gagandeep Singh
cover: "/blog/assets/images/2024-05-13-bain-and-co-interview-experience.jpg"
categories: bain interview staff-software-engineer consultant
excerpt: I interviewed for the position of Staff Engineer II at Bain and Company in Jan-Feb 2024. They were hiring engineers for the Gurgaon team (that's a small team of &lt;15 engineers). They had posted the job on LinkedIn, that redirected to..
---

![cover-photo](/blog/assets/images/2024-05-13-bain-and-co-interview-experience.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"}

Photo from <a href="https://www.brandcolorcode.com/bain-company/">Brand color code</a>
{: style="text-align: center;font-size: 0.8em"}

## Background

I interviewed for the position of **Staff Engineer II** at **Bain and Company** in **Jan-Feb 2024**. They were hiring engineers for the **Gurgaon team** (that's a small team of &lt;15 engineers). They had posted the job on LinkedIn, that redirected to their website where I applied. For those who haven't heard much about the company:

1. Popularly abbreviated as [MBB](https://en.wikipedia.org/wiki/Big_Three_(management_consultancies)), McKinsey, Boston Consulting Group and Bain & Company are known as the Big three management consultant firms.

2. As the name suggests, these are mostly into consultancy and not in product development. And unlike other consultant firms where developers are outsourced by the company to build something, these big firms mostly "plan" the execution. Generally, the actual implementation (code) is not done by these companies. They just meet clients to understand the problem, document everything and make plans.

3. Most of the roles are **Individual Contributor** roles where you're expected to travel for 20-50% of your time (based on role/seniority). This is true for engineering roles as well.


## Interview process

I got an email from their recruitment team that they want to schedule a hiring manager call to begin with. Except for one instance, entire communication happened over emails and the team was quite responsive. There were **five rounds** in total. I cleared all of them but because there was a single vacancy and high competition, I was informed that they chose someone else. Overall, it was a good learning experience as this was the first time I went through all the rounds for any company's process.

### Hiring manager round

This was scheduled with Sr. Director of Global Engineering team who was based out of Singapore. There are many companies that put you through the evaluation process directly but I like the organisations where we have a human interaction with a senior person before starting with the interview rounds. They make sure that they understand your current role, future growth path/expectations and also explain the new role in the best possible way. For example, most of us work with product/service based companies where travel is almost negligible for engineers. This was very different for Bain. Another thing was that we get to code less in consultant roles. He made sure that I completely understand these two things before starting with the evaluation process. He sounded calm and "not in a hurry" like many directors/senior managers. We did some technical discussion around my projects but only on surface level.

### Live coding round

This was scheduled with a **Senior Engineer** who just got promoted to **Staff**. Generally, when you talk to Engineers during interviews, you might find them less expressive but people at Bain are much more open (and somewhat more professional) when it comes to communication. This is because Engineers also deal with the clients and are expected/trained to be good on communication skills. A junior engineer also joined the interview as an observer. He dropped mid way due to a clashing meeting. The problem statement was based on strings and 1D arrays (quite simple, but I don't remember exactly). While the problem was simple to solve, the platform they chose was not good. Most of the coding interviews I gave were on platforms like Coderbyte that has a wide choice of languages. Being a Ruby Engineer, I prefer to solve DS questions in **Ruby** but here, the choice was among **Python, Java and Javascript**. This was not communicated by HR team in advance. Somehow I ended up coding the solution in Java, which is my second language of choice, and that ran without any issues. I expected another question but the interviewer preferred to play around with minor changes in requirements and edge cases, all of which were passing. This sounded easier than I expected and what I faced in other companies.

### Technical Assessment

This was basically a **System Design / HLD round** with another **Staff Engineer II.** I prefer interviews during morning hours because I'm fresh at that time. But because of interviewer's preference/availability, this was scheduled in the evening. I'm generally mentally-saturated by that time (6PM IST). The problem statement was around designing a **blob** **storage platform** like **Dropbox / Google Drive**. Although this is a common HLD problem, I had not solved it before. The only way was to think from first principles. I'm good at cloud related things and protocols so that never remains an issue for me when I'm solving a HLD problem. I'm also good at databases but my major exposure is around SQL databases only. Considering the numbers shared by them, I tried to propose a NoSQL database for the metadata storage. They immediately pointed this out and asked me why I chose a NoSQL database here. When I started pointing out the reasons, I figured out that I was not having strong reasons to go for NoSQL. Within next two minutes, both of us mutually agreed to start with a SQL database like PostgreSQL. The major discussion in a blob storage backend (from a functional perspective) is to think about:

1. Breaking file(s) into chunks for both uploading/downloading.

2. Hashing these parts to see if it already exists on the backend (can happen frequently for large platforms or when people upload duplicate files).

3. Encryption/Decryption on client/server side (this was one of the requirements).

4. Talk about Disk, storage, cost, etc.


I had read read an article on [Amazon S3](https://www.allthingsdistributed.com/2023/07/building-and-operating-a-pretty-big-storage-system.html) (not full, it's a long one for me to absorb). I took some ideas from it when talking about low level storage. Although S3 is much more complex and I was not supposed to talk about things like storage tiers. We didn't conclude our discussion around all the points (can happen in a HLD round, that is more open ended in comparison to coding rounds) but he asked me to talk around APIs, schema design and draw some boxes on [Excalidraw](https://excalidraw.com/) (my choice for drawing diagrams) before the time ends. The overall discussion went very well. Hence, I qualified.

### Technical Assessment (Case Study)

This was another HLD round scheduled with **Director of Engineering, India team**. He wanted to understand about my projects in great depth and probe around choices. Then we moved to designing an app that we regularly use - like **Zomato**. He asked some problems specific to:

1. How we'll show restaurants/branches near customer's current location?

2. What tables will you make to store restaurants, branches, etc?

3. How would you build Zomato's homepage (gave some requirements, similar to the actual app)? Write SQL queries and see what things should be cached for fast page load.


While the previous round was centered around a single problem (Blob storage), this included my projects, a case study, discussion around databases, discussion around other technology choices, and a lisuttle bit on the product side.

\--

After this round, I got a phone call from the recruiter (for the first time). They gave me feedback on all my previous rounds which was very positive. The only negative she pointed out that I sounded comfortable with only Ruby programming language. She concluded this because I had mailed them about the platform issue in live coding round that did not have sufficient language options to choose from. I explained the same and I told that I was comfortable enough with Java to solve the problem within time. I again explained that I consider myself as a *Sr. Engineer*, and not a *Ruby Engineer* but their platform should have had more options available. Otherwise they should inform the same before the interview. It was important for them to clear this expectation from their side, as for client projects languages keep on changing. Moreover, most of their enterprise clients were using Java/C#.

They told me that next round is with an Expert Partner. This will be a Behavioural Round (kind of cultural fit round). Because the partner is generally travelling, I'll have to provide my availability over multiple slots in a week and they'll schedule in any of these slots.

### Behavioural Round

As explained, this was held with an **Expert Partner** from **APAC region**. The interview was scheduled for 45 minutes but in the beginning they told me that they just have 30 minutes because of a last minute meeting setup with a client. This was the first time I was giving Behavioural Round in my life so I had spent considerable time in understanding what this round is meant for. Obviously, I couldn't fool this person if I was not a cultural fit because they had 21 years of experience and 16+ years within Bain. But I said to myself - If I fail in this round after clearing 4 technical rounds, this would be the worst thing. I checked a lot of videos to learn about the STAR approach, making stories out of things you've done in your career. There was one short video that suggested to build stories around (at least) these axes:

1. Stories that indicate good leadership,

2. Where you acted as a great team player,

3. Accomplishment story to show that you can tick off your goals,

4. Overcoming hurdles to show that you can surpass challenges,

5. Failure story to show that you learn from your mistakes and bounce back.


When I say “stories”, don’t take me wrong. It doesn’t mean creating fake stories. Because the interviews are structured in a way that you’re evaluated on a lot of things in a short interval, it’s good to know the axes on which you should prepare before-hand. Otherwise you might have showcased all the skills but you’d still forget those when you’re asked during an interview.

The interview started with our introductions. He talked a little bit around Logistics business (i.e. around LocoNav). Then they said “*You’ve worked at LocoNav for 6 years, can you explain me one big task that you completed each year*”. This was the moment when all the preparation felt useless. While I’ve done a lot of work at LocoNav and everybody around me knows that, I felt blank for 2-3 seconds. After that I started explaining my contributions. There were a few more questions that were no where related to what I had expected. At the end, they asked if I had questions for them. I asked a few questions and we wrapped with the interview.

## Conclusion

The interview at Bain took slightly longer than other companies. The overall process took close to 2 months as rounds happened within a gap of 1-2 weeks, specially for the last round where availability of Expert Partner was very limited. Even after the last round, they took 2-3 weeks before sharing the result. I was informed that there was **only one opening** for this position and they shortlisted some other candidate. I probed for more details during the month of March because this feedback seemed like a generic *platform generated email*. The HR added the hiring manager to the email and they both confirmed the same. It sounded somewhat like:

> From HR:
>
> Thank you for reaching out. We had multiple candidates, including yourself, who progressed to the final stages of the interview. It's important to note that while you demonstrated strong skills and abilities, the candidate who ultimately succeeded in the final round performed exceptionally well. This outcome doesn't reflect any deficiency in your skills; rather, it's a testament to the competitive nature of the final selection process.
>
> \--
>
> From the Hiring Manager:
>
> Thanks for reaching out. Yes, we liked your candidature and got good feedback from the interviewers. Unfortunately we only had one open position at this point of time and had a tough decision to select one candidate. We will surely reach out to you if we open more positions in the future.
>
> Once again, really appreciate the time and effort you spent for the interview process with us.

I got some relief after this email, because I believe feedbacks must be shared when a candidate spends time with you. Including all the emails, the phone call and the interview rounds - I spent more than 6 hours with them. I read a lot about consultant life during the interview process to see if I can work like that (because I'm not a travel freak). I might have given a chance to this role if I was selected. I also thought - will I stay relevant in the *SaaS Product industry* if I opt for this role for a few years (that doesn't involve hands-on coding)? But whatever happens, happens for the best. I got the complete experience but I was not selected. I was overall happy.
