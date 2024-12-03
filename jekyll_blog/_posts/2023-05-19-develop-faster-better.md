---
layout: post
title: "Develop faster, better"
date: 2023-05-19
published_on: "19th May, 2023"
author: Gagandeep Singh
image: "/assets/images/2023-05-19-develop-faster-better-cover.jpg"
categories: optimization development productivity
excerpt: Over the years, has your speed of development improved?. Ofcourse, it would be much better than what it was when you were straight outside college. But have you significantly improved each year?
---

Photo by <a href="https://unsplash.com/@milancsizmadia?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Milan Csizmadia</a> on <a href="https://unsplash.com/photos/pYmH0eTpr70?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

Over the years, has your development speed improved? Ofcourse, it would be much better than what it was when you started your first job. But have you significantly improved each year? If you didn't, or if you're unsure, then read along.

I remember my training days, where I was given a Dell laptop with Ubuntu 14 installed on it. While I had done a lot of projects during my college days, I couldn't be friends with Unix. I had only used Windows XP during school days and upgraded to Windows 7, Windows 8 and then Windows 10 as they were released. I liked good UI, themes, wallpapers, and DOS terminal looked like a punishment in front of good UI. I had heard "terminal is powerful", and I realized it only when I started using the Unix terminal. Starting my professional career with Ruby, where many people prefer lightweight editors like Sublime Text, a good amount of my time was spent on terminal. While all this learning was overwhelming, I became very comfortable in the next few months.

Over the past many years, this is how I feel I have improved my development speed:

1. **Log files** - No development happens without challenges and dead-ends. I've seen many developers who don't investigate much on their own, and straight away ask their seniors or start searching about an issue on the web, both of which make sense but not before checking the logs. It could be your framework logs, database logs, or some logs that come up after enabling debug/verbose mode in an application. Believe me, you can't be a good developer if you are not in habit of checking the logs. If you can debug what's wrong without going here and there, you'll save time in the long run (and possibly master `tail` command options).

2. **Know your tools** - Let's say you get into a situation where a job should have run at night but it didn't. You know the issue because some data didn't get populated by this but you don't know where to start from. Most of the companies these days use a lot of SaaS solutions to ease this debugging. We now have logging platforms, infrastructure monitoring platforms, APM platforms, and much more. And if we don't use these tools to debug these issues, then what is the point of paying them? Spare time to explore all these tools. They help you much beyond this simple example (Eg. APM helps to figure out performance bottlenecks, debug downtimes, deprecate old endpoints, etc.).

3. **Avoid using a mouse/trackpad** - In other words, use keyboard shortcuts as much as possible. You don't have to remember tonnes of shortcuts per tool - good tools have standard shortcuts. For example, all text editors would have `CMD + N` (`Ctrl` instead of `CMD` for windows) for opening a new file, `CMD + Option key + Left or Right arrow key` to move across tabs (including browsers), `CMD+<N>` to go to Nth open window, and so on. After years of practice, this saved a lot of time for me.

4. **Master the terminal** - If you do this, you can do certain tasks very quickly. I've seen developers working at a good speed when they're on their machines. But if they need to SSH to a server to check something, they become very slow. Although mastering terminal in itself is a very vast topic, because there are many things you can learn, but one of the most useful trick is *Reverse Search*. I type not more than 3-4 characters to execute the command I need.

5. **Setup aliases** - Although it is possible to setup aliases for a lot of things, I'd recommend setting this up at least for git operations. I use the following git aliases on my personal machine.
```
[alias]
  co = checkout
  br = branch
  st = status
  ci = commit
  po = push
  fo = fetch origin
  pu = pull origin
  df = diff
  dfs = diff --staged
[push]
  default = current
[pull]
  default = current
```
so to do a checkout, I do `git co <branch>`. And to push my branch to remote, I just write `git po`. Also, I use reverse search than typing even this much 😛.

6. **Find alternatives continuously** - Whenever you're doing something repeatedly, there are high chances that many people are doing the same thing and there might be some way to do it fast. For example, engineers spend a good time using browsers and there are a lot of browser extensions that can help you do things fast. I remember some time ago I was struggling to take screenshots of pages that were slightly larger than my window (so I zoomed out to take screenshot 😋). Later I found an extension (GoFullPage) that scrolls your page from top to bottom and creates a screenshot that can be exported to Image/PDF. Similarly, there are times when you need to copy paste some tabular data but there is no export option, so an extension (Table Capture) allows you to right click on that table and copy paste that to a google sheet. This worked for about 90% of use-cases. Another good extension (Authenticator) allows to keep all the 2 step verification codes (those 30-60s expiring  OTPs) in the browser itself, so that you don't need a phone everytime.

There could be 10 more things I can add to this list, but I want to keep this short. For example, there's no mention of how you can use GPT tools because there are many posts on that already. I hope this gives you some idea and rest you can think on your own. The way to work fast is to first realize that you are slow, and then think what can be optimized. If you have this thought process, you can continuously improve your speed.
