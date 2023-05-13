---
layout: post
title: "Small testing loops"
date: 2023-05-01
published_on: "1st May, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-05-01-small-testing-loops-cover.jpg"
categories: debugging optimization
excerpt: If you are a software developer, you must have spent a considerable part of your time debugging the code you, or someone else wrote. At times, it is quite frustrating to debug code due to...
---

![cover-photo](/blog/assets/images/2023-05-01-small-testing-loops-cover.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"
}

Photo by <a href="https://unsplash.com/it/@nublson?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Nubelson Fernandes</a> on <a href="https://unsplash.com/photos/CO6r5hbt1jg?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

If you are a software developer, you must have spent a considerable part of your time debugging the code you, or someone else wrote. At times, it is quite frustrating to debug code due to it's current state, and you find the need to [refactor it](https://refactoring.com/). But in a hurry to finish the task on time, we start solving the problem directly and testing it out, often wasting a lot of time that could be easily saved. Had we spent some time on understanding the moving parts, our "testing loops" could have been shorter.

At the time of writing this, I found out that "testing loop" is not a defined terminology in software engineering, so this is what I mean by it
>"The process of changing a piece of code, and testing it out by some means" forms a loop. Smaller the loop, the faster we change and test our code, and our frustration is minimum.
{:style="letter-spacing: 0.1px"}

Let's assume you're a web developer who is doing a code change in a service class that is called by a REST API to serve the response. Now in order to test this change, you can:
1. Update an automated test that was testing this API and can check the response.
2. Use cURL/Postman to test your code and ensure that the response is updated.
3. Test a small piece of change inside a [REPL shell](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop), if your language/framework provides that, and verify that the class method is returning the change as expected. Some examples of such shells as `rails c` for a rails app, `python` for a django app, `jshell` for a java app, or a browser developer console  for Javascript apps.

Here, step 1 and 2 can be very slow if you have a medium/large application because your web server/test suite will take time to boot, whereas step 3 will be very fast. Being a rails developer, I always test such changes inside `rails c`. This might seem like a very small optimization but there are times when you end up testing the change multiple times. If something takes time (eg. a web server reloading after change), we might also switch to other tasks (or distractions) in the interim.

This is just one example of improving our productivity as a developer (frustration and productivity are inversely proportional). I'd recommend you to spend more time in finding shorter ways of testing things out than wasting time in longer testing loops. That would help you for years. Although I strongly believe that developers are solely responsible for their code (no reviewers, no QAs) and by no means I'm saying that we should abandon testing code via test cases and postman. But yes, while you're in the middle of debugging, use shorter ways and in the end test out things by normal means.

The motive of this post is not to promote use of REPL shells, but I've used them for about 8 years now and they are great tools to learn the language fast, and also to debug things. If your language supports this and you never used it, you must try this once. Try this out next time you get into debugging something time consuming and let me know if this helped.

