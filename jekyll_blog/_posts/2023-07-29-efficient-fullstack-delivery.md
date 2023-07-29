---
layout: post
title: "Efficient Fullstack Delivery"
date: 2023-07-29
published_on: "29th July, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-07-29-efficient-fullstack-delivery.jpg"
categories: full-stack efficiency product
excerpt: Many organisations face the issue of missed deadlines. The reasons for this might be a one-off case or repeated scenarios. Today, we'll try to understand how can we optimize full-stack product delivery as a team
---

![cover-photo](/blog/assets/images/2023-07-29-efficient-fullstack-delivery.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"
}

Photo by <a href="https://unsplash.com/@cherrydeck">Cherrydeck</a> on <a href="https://unsplash.com/photos/rMILC1PIwM0">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

Many organisations face the issue of missed deadlines. The reasons for this might be a one-off case or repeated scenarios. Today, we'll try to understand how do we optimize full-stack product delivery as a team.

1. **Clarity of thought** - The leaders (product & engineering leads) involved in building a specific product should have a very clear thought on what we're trying to build. If the product is in very initial phase, this can be somewhat hazy. It is not a problem to "not have a well thought product". But don't let the hazy idea communicate to development teams, otherwise everyone will have their own interpretation of this. Engineers are programmed mentally to work on exact requirements. The sense of ambiguity doesn't let them work efficiently, at least in initial years. To get the best output from them, give them clear requirements.

2. **Get everyone on the same page** - I don't generally encourage meetings that involves many people, be it remote, or in person. Most of the things my teams work on are communicated on JIRA tickets and clarified by chat. But there's a phase when you are starting on something new. The initial idea / walkthrough should be done over a call (or in-person meeting if working from office). This is the point when product and design have almost finalized the workflows and engineering leads have given a go-ahead on feasibility of product and the story is ready. Set-up a meeting with the team, explain them the idea, take their inputs, do the required changes (if any), see if everyone has clarity and then **freeze the story**.

3. **Don't exclude testers** - In point 2, the "team" doesn't mean only backend and frontend engineers. QAs are often shared across multiple product teams, so we think we'll share the story with them once development is complete. This is an unoptimized process. We had been doing this in the past and it just brings confusions. Some of the issues that happen are:

    * Corner cases in product flows are not figured out initially as QA was not present in initial meeting.
    * Some engineers might explain the product to QA team in their own way when it comes for testing. The interpretation can be very different. Even if product team explains the flow, it's waste of effort as they already did it initially.
    * Fixing corner cases might mean change in flows, design and hence code.

4. **Walking on water and developing software from specifications are easy if both are frozen** - This is a very famous quote in software engineering. Change is inevitable in software projects, and this doesn't mean that our software shouldn't expect future changes, but the point is that current development cycle should have fixed set of requirements. Product teams should have enough discussions with the required stakeholders to make sure that they are aware of what is "actually needed". Cost of change in a software under development is usually high - because product team updates the story, design teams update their designs, developers change their code (often ending up adding hacks because they already built the previous version), QA needs to test all impacted areas, and the overall deadline shifts.

5. **Estimations** - There are two things we'll discuss: Dev estimates and overall estimates. Assuming the designs are ready, the expectation is that developers should start working on the product right away. But don't miss the estimation part, specially when you're working with a new team. My team was doing [PERT estimates](https://projectmanagementacademy.net/resources/blog/a-three-point-estimating-technique-pert/) to do task breakdown and estimating individual tasks in the past. Once we got enough idea on our speed, we now share a ball-park (rough) estimate mostly. IMO, all freshers should learn doing PERT estimates. Apart from just estimates, it also helps you to break your tasks into subtasks. Once dev estimates are complete, product team needs to take QA estimates as well, add some buffer (this comes by experience) and share overall estimates as a delivery date (**Bonus point**: Don't forget to consider leave plans at the start of development).

6. **Realistic Parallelism and team motivation** - [9 women cannot deliver a baby in a month](https://planningengineer.net/9-women-cannot-deliver-a-baby-in-one-month/). This phrase is used in software engineering to explain that we shouldn't expect "faster delivery" just because we have the option to put more people. If your team is new, or the organisation itself is a startup, I'd always recommend to start with less people (or you'll just be solving their conflicts). People management is a task in itself when you're managing a development team that has multiple sub-teams. I remember, back in 2018 when I was developing APIs for our new mobile app, I was the only one from backend team, 2 were from frontend, 1 QA and 1 Product guy. Even then we faced a lot of issues because none of us were experienced to work at that pace, and with less clarity. Our initial app took months to take off. Revised dates and unrealistic expectations of parallelism often affect team's motivation because leaders can't see the needle moving and developers are expected to overwork for days and weeks.

7. **Technical perspective** - Most of the above pointers are related to overall team, so sharing some tips for the developers here:

    * Once product discussion is complete, backend and frontend leads should connect separately to finalize set of APIs.
    * Make sure that error codes, error responses are consistent and clearly understood by both the parties. This is for the long term, not just for this product.
    * Create separate set of stories for backend and frontend to that JIRA tracking is clear. Backend should start first and build APIs while frontend should make designs meanwhile.
    * If backend needs some Devops assistance to launch a new server, database or something similar, do include that in the requirement and create tasks for them with priorities mentioned.
    * If backend development is expected to take much longer due to some initial setup of things, clarify the same. You might need to build some mock API responses so that frontend team can integrate the same meanwhile. We have used [this tool](https://github.com/iridakos/duckrails) in the past for this use case. If this is not possible, atleast mention exact API responses in your ticket so that frontend team can write code against it and integration testing can be done later.
    * Don't skip writing tests. No system has been constructed in a way that it remains unchanged in the future. Your manual testing effort is going to exponentially increase as more changes come.

Above insights are from my experience working on multiple full-stack products @ LocoNav, both for mobile and web clients. I've contributed both as a developer and as a manager. So I've seen the situation from both the lenses.

Take care and see you guys in the next post.

