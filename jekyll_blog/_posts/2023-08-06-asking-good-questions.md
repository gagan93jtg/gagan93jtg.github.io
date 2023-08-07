---
layout: post
title: "Asking Good Questions"
date: 2023-08-06
published_on: "06th August, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-08-06-asking-good-questions.jpg"
categories: questions context
excerpt: On a daily basis, we communicate with a lot of people - family, friends, office colleagues and often with end customers. A lot of this communication is in the form of asking questions and getting answers.
---

![cover-photo](/blog/assets/images/2023-08-06-asking-good-questions.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"
}

Photo by <a href="https://unsplash.com/@camylla93">Camylla Battani</a> on <a href="https://unsplash.com/photos/AoqgGAqrLpU?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

On a daily basis, we communicate with a lot of people - family, friends, office colleagues and often with end customers. A lot of this communication is in the form of asking questions and getting answers. If I ask you - _How hard it is to ask questions?_ Different people might have different answers to this, depending on a few things like:

1. How vocal they are generally?
2. How much they are comfortable to discuss the topic?
3. Is the problem statement clear?
4. Can they describe their problem in a way that the second party can understand?
5. Is there a language barrier, knowledge gap or missing context?

Generally speaking, many people **do not** think a lot before asking questions. While it encourages them to openly ask questions, it also creates a challenge in understanding the problem for the second party. To solve the same, a lot of to and fro happens while communicating. This is still ok when the parties are communicating synchronously (eg. over a call or in-person meeting) because the parties can clarify their doubts there and then, but becomes worse when the same is happening over an asynchronous medium (eg. chat or email). A common example of such email as an engineering team is -- communication with the end customers or other departments where people describe their problem in shortest possible way and assume they will get a solution. Without a process, such emails often run for weeks.

There are multiple occasions when our sense of asking questions brings different outputs. People who have been using ChatGPT for any purpose will agree with me on this. Response from such generators depends not only on our questions but the context and detailing we provide. For those who have not got a chance to get their hands dirty yet, here are two questions I asked ChatGPT (one with minimal context, another with a detailed context) :

> Q: Give me a small paragraph  on topic:  optimizing page load

> A: In the digital landscape, where milliseconds can make a difference, optimizing page load speed is a non-negotiable priority for any website. As a leading technology company, we understand the significance of delivering an exceptional user experience. One of the most effective ways to achieve this is by keeping images small and well-optimized. Compressing images without compromising quality significantly reduces load times, ensuring that users don't have to wait for heavy media files to load. Additionally, minifying JavaScript and CSS files is crucial to eliminate unnecessary white spaces, comments, and code, resulting in faster processing by browsers.....

It generated 3 such paragraphs, about 1000 words in total. I added more context to the question in order to get a shorter response and also gave an idea on topics it should focus on:

> Q: As an experienced blog writer on medium for a leading technology company, help me write a small paragraph, not exceeding 250 words. Topic is optimizing page load speed. And in the blog I talk about keeping images small, minifying js/css, keeping large javascripts to the end of page and using CDN

> A: Optimizing page load speed is paramount in today's digital world. As a leading tech company, we prioritize delivering an exceptional user experience. To achieve this, we focus on keeping images small and optimized, compressing them without compromising quality. Minifying JavaScript and CSS files further reduces load times by eliminating unnecessary code. Additionally, placing large JavaScripts at the end of the page ensures critical content loads first. Leveraging a Content Delivery Network (CDN) for static content speedup enhances website performance by distributing resources across multiple servers worldwide, reducing server response time. By implementing these strategies, we guarantee a lightning-fast and seamless user journey, fostering higher engagement and satisfaction.

People have now understood the value of **context**, atleast while using AI generators. Surprisingly, same is missing in some cases when we question humans. I often get emails and messages like *The feature X is broken, can you check?* It is not that the reporter did not their homework. They must have opened the website, clicked some button(s), filled a form (maybe?), seen an error, but they did not tell me all this. They should realize that either I'll have to do all of this again, or ask them about the same, so better share these details. In my personal ToDo list, I deprioritize tasks that do not contain sufficient context. If you're facing a problem, you should explain it in detail. Having details will help geting the solution sooner and would eliminate the need of asking **obvious questions** -- Is this breaking for a specific user? Does this break for all the cases or sometimes? Can you share me the error message, error code or a screenshot?

Similar issue happens in some cases, when we're communicating within engineering teams. When such issues reach the developers for debugging, they respond like: _I couldn't find the issue despite spending 2 hours on it_. While this is a good first response, this is what anyone would expect afterwards --
1. Did you try reproducing the issue as mentioned, before looking into the code?
2. Did we get the exact problem statement in technical terms (i.e. what exactly is breaking)?
3. Could we figure out what specific class or method in the code deals with the broken part?
4. Does the code need restructuring in order to debug? If we need to restructure, do we have automated tests?
5. Are there recent changes in this code? Do we know after which release did this started breaking?
6. Do you need someone to pair with you in order to debug this? Or probably move this to someone else?
7. If you want someone else to check, have you recorded the investigation in the issue tracker as a comment?

Some of the above points might not be applicable to all issues, but this is what comes to my mind generally. Such questions help in building a clear understanding of the problem and proposing a fix that makes sense. You get half of the solution by understanding the problem clearly. When you're seeking solution of your problem from someone else, make sure you can show what you have tried before reaching them out. Have answers to all the obviou questions. This is an underrated skill but optimizes much of the communication cycle.

This post is just an introduction to asking good questions. There's a very detailed, opinionated post (might sound little rude) on this topic already. [Click here](http://www.catb.org/~esr/faqs/smart-questions.html) to read the same. Take care and see you guys in the next post.


