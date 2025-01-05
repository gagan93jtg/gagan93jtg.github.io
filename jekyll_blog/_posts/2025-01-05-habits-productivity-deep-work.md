---
layout: post
title: "Habits, Productivity & Deep work"
date: 2025-01-05
published_on: 5th January, 2025
author: Gagandeep Singh
image: "/assets/images/2024-01-05-habits-productivity-deepwork-cover.jpg"
categories: habits productivity deep-work growth
excerpt: I resigned from my first company in December 2018 when I decided to switch from a services company to an early-stage product startup. Although the previous company wasn't treating me badly, there was a trend of people leaving after 2-4 years,
---

Photo by <a href="https://unsplash.com/@carlheyerdahl?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Carl Heyerdahl</a> on <a href="https://unsplash.com/photos/silver-imac-with-keyboard-and-trackpad-inside-room-KE0nC8-58MQ?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

# Background

I resigned from my first company in December 2018 when I decided to switch from a **services company** to an **early-stage product startup**. Although the previous company wasn't treating me badly, there was a trend of people leaving after 2-4 years, which was on my mind, along with other factors. My previous project, which I worked on for more than 2.5 years, was almost wrapped up, and I was being assigned random tasks that I didn't enjoy. Finally, I joined this product startup, [LocoNav](https://loconav.com/), on February 5th, 2018.

While onboarding at my current organization, [Branch](https://branchapp.in/), took almost a week due to extensive documentation and mature processes, the situation at LocoNav was completely different at that time. Within the first four hours, I was logged into their production server using my new laptop to check a [log rotation](https://www.crowdstrike.com/en-us/cybersecurity-101/next-gen-siem/log-rotation/) issue. This might seem unusual to those who haven't experienced the early startup environment, but for those who have, it's not surprising. You need to be productive from day one and ensure your efforts align with everyone else's. With all this hustle came a lot of stress, and there were many reasons for this stress. Here are a few:

1. I had moved from a services company. Although it was also a startup, its processes and hierarchies were more formal. Sometimes, I would think, *We should have the "xyz process" from my old company to avoid this problem*.

2. Not just me, but most of us came from service or stable companies. So, working at this fast pace was totally new for us. Everyone found it tough to deal with the uncertainty, juggling different tasks, and the ever-changing requirements. When I joined, there were no product managers. So, we were building a **product** without a **product manager**.

3. I aimed for perfection in many tasks, and that was a bit of a mistake. I didn't realize that in early-stage startups, much of what we build might be discarded, so aiming for perfection from the start isn't necessary. Trying to balance perfection and delivery, I ended up stressing myself and sometimes overworking. (Though many APIs I wrote in 2018-19 are still running in their production 😀).


In this blog, I’m sharing what I've learned from working in both early-stage and mature startups. This will cover:

1. Finding a balance between **perfection, speed**, and the **stress** of delivering.

2. How much **context-switching** is beneficial and its impact on your **productivity**.

3. The value of **deep work** and how most of our jobs require it, but our environment isn't set up for it.

4. How your **habits** and **environment** affect your work.


Many of these insights are common to any corporate role. However, based on my experience as a Software Engineer, most examples will pertain to software design. So, let’s start 🚀

# Perfection & Speed

![Image from Unsplash](/blog/assets/images/2024-01-05-habits-productivity-deepwork-perfection.jpg){: style="display: block; margin: 10px auto;"}

I was quite a perfectionist when I joined LocoNav. Out of stress, I would write emails to my founder, VP, and a few teammates, sharing my thoughts and asking for their suggestions on the problems we were facing. These weren't product-related issues but suggestions on solving team problems (e.g., *Should we hire more?*) or individual problems (e.g., *How to improve productivity?*). While everyone appreciated my efforts to address these issues, not everyone was interested in solving them. Everyone has a unique perspective, and what seemed problematic to me might have seemed normal to someone else, possibly due to their past experience with similar situations.

The question for the need of perfection is tricky, and is very subjective to your current working environment. For example:

1. If you're a billion-dollar stock exchange firm or bank, perfection in your work is a basic requirement.

2. If you're a startup dealing with money, most of your work needs to be perfect. However, your idea of *perfection* will likely be **less strict** than that of a billion-dollar company because your processes are less mature.

3. If you're a company manufacturing medical equipment, even one defect can be dangerous or life-threatening. So, your standards for perfection will be very high.

4. If you're a company not heavily regulated due to the nature of your business, your standards for perfection might not be very high. Doing things in a better way takes time and money, and no one wants to spend that money unless necessary.


### Do you really need perfection everywhere?

I think most of the companies that build something new or cutting edge do not face a lot of compliance (at least initially). For example:

1. Stock companies that started between 2010-2020 can show how compliance has become stricter over time. In 2010, they didn't take all the measures they do now. Each step requires time and money, which startups often lack.

2. SaaS companies in Europe, or those handling European user data, had to change how they store, process, and delete user data after GDPR was introduced. Making these changes is expensive, especially for large products.

3. Many AI startups have been creating amazing products since ChatGPT appeared, but there isn't a governing body to set limits on AI use to ensure it's safe. For example, the CTO of OpenAI [wasn't sure](https://www.youtube.com/watch?v=lS0G2D6MKGw) if YouTube's public videos were used to train Sora, their video generation model.


Startups often operate in fast-paced environments where speed and innovation are prioritized over strict processes and documentation. Without external regulatory requirements setting clear quality benchmarks, teams lean towards quick fixes and ad-hoc solutions rather than building for long-term stability and scalability. This lack of enforced structure can lead to inconsistent practices, technical debt, and overlooked edge cases in both product and operational workflows. No one wants to shutdown their company or go to jail for doing something that’s illegal (at least, most of us don’t want to!). So if you’re under a governing body, ensure perfection accordingly. Otherwise feel free to experiment and take some risks (or technical debts).

I think this gives you an idea that the level of perfection depends on kind of business you’re building.

# Stress & Context switching

![Image from Unsplash](/blog/assets/images/2024-01-05-habits-productivity-deepwork-context_switch.png){: style="display: block; margin: 10px auto;"}

Handling stress in a startup requires balance and resilience. In the early days, we worked six days a week, with one day from home and five in the office. This wasn't a set rule, but many of us followed it. I didn't burn out quickly, but I made sure to rest when needed. Negotiate and align priorities with your teammates and manager because time is the most valuable asset for a startup. It's crucial to have leaders who are supportive and practical. While everyone is expected to work quickly and deliver almost daily, not everyone will be a 5x or 10x developer.

I remember many days when I would come home utterly exhausted, unable to even hold a conversation with anyone. My family was concerned and thought I had made a mistake by leaving a stable job to join a startup. At that time, I also had little idea of what the future held for me. Despite this, I was driven by the motivation and support I received from my team and the leaders around me. There were two major sources of stress during this period:

1. In the first 3 months, I mainly worked on building the API layer for their new Android app. We were designing screens, building APIs, and developing the mobile frontend all at once. This simultaneous work caused a lot of back and forth, leading to **rework**. While redoing tasks is common in startups, it caused frustration for everyone. Too much parallel work can be counterproductive, showing our inexperience with working at such a fast pace.

2. Since everyone needed to handle multiple roles and most things were unstable, I was involved in many tasks besides just building the API layer. I had to switch between different tasks, which sometimes meant I accomplished **nothing concrete** on a particular day. This was very discouraging for me.


One clear lesson I learned from observing my day was that to **make an impact**, I needed to **prioritize** tasks. In my previous role, this kind of prioritization wasn't necessary because things were stable, and the layers of management above me handled it. Gradually, I became someone who learned to say ‘**No**’ when something couldn't be done in a given time frame or when I was already overloaded with tasks. In some teams, this might be seen negatively, but in our small team, where everyone was making honest efforts, people understood that if I said *no*, it truly meant I was busy.

### Can we get a lot done with lots of context switching?

The short answer is “No”, but I have two takes here. Both of these conclusions come from my personal experience and what I learnt by reading.

1. If you often switch between tasks while working, you might initially feel more stressed and frustrated, as you'll see small progress in many tasks but nothing substantial by the end of the day. Over time, you'll learn to choose fewer tasks and complete some of them. From my personal experience, trying to handle 10 tasks a day was never effective for me. However, focusing on 3-5 tasks that needed minimal input before completion made me happier. When starting something new, I found that I needed 2-4 uninterrupted hours (without **context switching**) to create a solid plan for the coming days or weeks. I've worked closely with people who can't switch between tasks as efficiently as I do. This behaviour is explained by Robin Sharma in the book "*The 5 AM Club*", where he highlights the brain's amazing **neuroplasticity** (an ability to adapt, rewire, and grow with consistent effort and habits). So, context switching works for me because my mind has **adapted** to this pattern over months and years of practice.

2. Not everyone can handle a lot of stress, so not everyone can switch tasks efficiently. It's wrong to expect everyone to multitask well. I've written about efficient multitasking in a [separate blog](https://blog.gagan93.me/multi-tasking-is-not-so-cool) if you want more details. As a colleague, if I see someone struggling with multiple tasks, I always recommend prioritizing a few and completing those instead of making little progress on all of them.


# Deep work

![Image from Unsplash](/blog/assets/images/2024-01-05-habits-productivity-deepwork-deep_work.jpg){: style="display: block; margin: 10px auto;"}

I've been working remotely since March 2020, so I stay connected with my colleagues through instant chat apps like Slack. When Facebook was launched in 2004, "online connections" were seen positively, but over time, people realized how addictive these sites can be. While you can cut down on using apps like Facebook, Instagram, Twitter, and Snapchat, you can't stop using tools like Slack, Zoom, Meet, and Teams because you're expected to be **online** during work hours and respond to calls and messages. You might be wondering - *Why is this guy comparing Facebook to Slack?*

The answer is simple - all these apps steal your attention and reduce your ability to perform **Deep Work.** Apps like Slack are designed with instant notifications and visual cues (eg. red badges and notification sound) that trigger our brain. Each notification creates a sense of urgency, pulling us away from focused tasks. The fear of missing out (FOMO) on important updates further compels us to check messages frequently. Additionally, the platform's design encourages constant context-switching, **fragmenting our attention** and **reducing cognitive capacity** for deep, uninterrupted work. Over time, these repeated interruptions diminish our ability to **focus deeply**, making us more reactive and less capable of sustained, meaningful problem-solving. If you find it challenging to advance in your role, your **weak attention span** might be a significant factor. Referring to the career progression of software engineers, it's relatively straightforward to advance from a Software Engineer to a Senior Software Engineer. However, progressing beyond the Senior Engineer level requires demonstrating a **broader impact**, which can only be achieved through focused, uninterrupted time dedicated to cognitively demanding tasks. Deep work fosters a systems-level perspective, enabling the identification of patterns, anticipation of potential challenges, and proposal of innovative improvements. It also provides the opportunity to learn and refine expertise in critical areas that contribute to organizational success. Without consistent deep work, engineers may become ensnared in reactive workflows, unable to deliver the strategic value expected at the Senior+ level.

### Do our jobs encourage Deep work?

Unfortunately, many work environments, especially startups, don't really encourage deep work. With tasks often feeling urgent, we tend to reward **visibility over impact**, which unintentionally promotes shallow work, like responding to emails, attending long meetings, or giving constant status updates. These activities can create an illusion of productivity because they are **easy to measure** and **immediately visible**. On the other hand, the focused, uninterrupted effort needed for solving complex problems often doesn't show immediate results and can be overlooked in places focused on short-term goals. In my opinion, we need more mature managers who appreciate deep work for its long-term benefits.

### Some personal productivity hacks

These habits have helped me to get more work done without overworking:

1. Whether it's email or Slack, I've set up filters everywhere. If you're in a channel that no longer interests you, or if there are emails you're not interested in but are sent to a group, create filters for them. Check these messages occasionally instead of getting notified every time a new message arrives. Similar optimisations include muting channel notifications, leaving those channels, unsubscribing to some newsletters that you no longer need, or setting up email filters to ensure emails with certain subjects or sender IDs don't land in your inbox (allowing you to check them later).

2. I typically begin my workday around 8:00 - 8:30 am. This routine has been a part of my life for more than five years now, and it has significantly contributed to my ability to focus on crucial tasks before the rest of the team starts their day (given flexible working hours and distributed teams).

3. Although I get a lot done in the morning, I also set up Do Not Disturb (DND) on Slack when needed. It's better to clearly indicate that you're busy rather than ignoring messages.

4. I keep my mobile internet off during work hours (except at lunch) to avoid distractions from push notifications.

5. I keep a simple text file open in my editor all the time. It's got a list of stuff I need to focus on, plus all the raw notes about how things are going. Since the list covers everything from my own tasks to PR reviews, design document reviews, and other things, it's my go-to spot for figuring out what to do next. Prioritizing is just a matter of moving a few lines around. This setup also makes it easy to pick up where I left off after vacations or long weekends without feeling overwhelmed or lost.

6. I push all shallow work to a specific part of my day. These are minor tasks with medium to low priority, which I can tackle after completing deep work. On another note, there are often tiny tasks that take less than two minutes. I choose to do these tasks immediately because scheduling them actually wastes more time.

7. I maintain a clutter-free physical workspace, ensuring that my desk and surrounding area are organized and tidy. This helps me focus better and reduces distractions. Additionally, I relocated to a quieter place a few months ago, which has significantly improved my ability to concentrate and work efficiently (more details in the next section).


# Habits and environment

![Image from Unsplash](/blog/assets/images/2024-01-05-habits-productivity-deepwork-cluttered_desk.jpg){: style="display: block; margin: 10px auto;"}

Your room is a reflection of your mind. The state of your room, whether it's organized, cluttered, or decorated in a specific way, can often reveal aspects of your personality, thought process, and overall mental state. A tidy room signifies a clear mind and a messy room indicates a more chaotic inner world. I’m sharing this because I moved to a cleaner workspace in October 2024, and it has improved my focus. Having worked from home for a long time, it was important for me to set up a space away from regular household distractions, which I had become accustomed to working with.

During the time I set up my new desk, I added three books to my bookshelf: **Atomic Habits**, **Deep Work**, and **Zero to One**. While the third book focuses on entrepreneurship, the first two helped me adjust my **habits** and **work patterns** to be more productive.For example, I used to struggle to read regularly and would save reading for the weekends because my weekdays were busy. However, in *Atomic Habits*, the author shares a simple but useful tip:

> It’s easy not to practice the guitar when it’s tucked away in the closet. It’s easy not to read a book when the bookshelf is in the corner of the guest room. It’s easy not to take your vitamins when they are out of sight in the pantry. When the cues that spark a habit are subtle or hidden, they are easy to ignore.

He suggests placing a book under your pillow to encourage more frequent reading, and that's exactly what I did. In the morning, I would wake up and spend 10 minutes reading, repeating the same before bed. I thought I was "busy" during the week, but making this small change wasn't difficult since I was using that time to scroll through social media anyway. As a result, I finished reading these three books in just **9 weeks** (something that would have taken me at least 16-20 weeks if I only read on weekends). Some days, I got so interested in the topic that I spent 20-30 minutes reading instead of just 10. It was definitely better than spending those 20-30 minutes on Instagram 😉. This habit lasted for about 4 months, but now the streak is broken, so I read 3-4 nights a week instead of 6-7 (still much better than just weekend reading). One reason for this change is that I switched back to technical books, which require more focus and the right mood to read.

While it's important to have good habits, it's even more crucial to learn **how to fit them** into your schedule, so you don't struggle with prioritizing what's important. Reading *Atomic Habits* really helped me with that. Let me share two more habits I've developed over the years that I believe have helped me grow:

### **Boredom is important**

Many people who struggle to grow beyond a certain point often claim they are extremely busy—whether genuinely or by filling their time with low-impact tasks that create an illusion of "busyness." While constant activity might feel satisfying, it often leaves little room for **strategic thinking or mental clarity**. Surprisingly, boredom plays a vital role in growth. It’s in these quiet, unoccupied moments that your mind can wander, reflect, and make unexpected connections. Boredom is not idleness. it’s about giving your brain the space to process thoughts, spark creativity, and identify priorities. Without moments of stillness, you risk being trapped in a cycle of reactive tasks, never pausing to think deeply or plan effectively for the future. Sadly, social media apps [eliminate boredom](https://blog.gagan93.me/cost-of-time#heading-technology-addiction) by constantly feeding quick dopamine hits through endless scrolling, notifications, and bite-sized content. This prevents our minds from wandering, reflecting, or engaging in deeper thought.

### Simplicity is clarity

This habit is deeply rooted in my mindset, drawing inspiration from both **religious beliefs** and **practical experiences**. On the religious side, there’s an emphasis on leading a **simple and minimal life**, free from unnecessary complications. This perspective has taught me the value of clarity & focus, which extend far beyond personal life. Similarly, as an engineer, simplicity isn’t just a preference while building large systems — it’s a functional necessity. Simple systems are inherently easier to understand, debug, and improve. They lower the cognitive load on those working with them, allowing teams to collaborate effectively, onboard faster, and make informed decisions with confidence. On the flip side, I’ve also worked on (and even built 🫣) systems that were architected in a way that they were not only hard to understand but harder to extend. So seek simplicity as a principle in every aspect of your life.

# Conclusion

In this article, I shared my journey transitioning from a services company to an early-stage product startup, highlighting the challenges and lessons learned along the way. We explored the delicate balance between perfection and speed, the impact of stress and context switching on productivity, and the importance of deep work for personal and professional growth. Additionally, I shared personal productivity hacks and the significance of habits and environment in enhancing work efficiency. By reflecting on these experiences, I hope to provide valuable insights for those navigating similar paths in dynamic work environments.

Before ending this blog post, I’d like to share photos of my **existing setup** (that was in the middle of our living room) and **current setup** (isolated on a separate floor where I use to work out during COVID).

![Image from Unsplash](/blog/assets/images/2024-01-05-habits-productivity-deepwork-my_desk.jpg){: style="display: block; margin: 10px auto;"}

# Further reading

1. If you’re interested to seriously read about [Deep work](https://www.amazon.in/dp/0349413681?ref=ppx_yo2ov_dt_b_fed_asin_title) or [Habits](https://www.amazon.in/dp/1847941834?ref=ppx_yo2ov_dt_b_fed_asin_title), and their impact on your life, read the respective books.

2. I’ve shared my opinions about [multi-tasking](https://blog.gagan93.me/multi-tasking-is-not-so-cool) some time ago on my blog.

3. Despite working in startup throughout my career, I hated overworking (and almost never did it). In a [blog post](https://blog.gagan93.me/eight-productive-hours), I shared common reasons that cause you to work beyond eight working hours.

4. Apart from [Interview related content](https://blog.gagan93.me/tag/interview) (that’s always most viewed), there are plenty of technical blog posts that I’m sure you’ll like (few of my favourites are [this](https://blog.gagan93.me/avoid-redundant-complexity), [this](https://blog.gagan93.me/cloud-pricing-vendor-lock-ins) and [this](https://blog.gagan93.me/things-code-reviewers-hate))


---

Thank you for reading this. Please leave your thoughts in the comments 😊
