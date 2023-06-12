---
layout: post
title: "Things Code Reviewers Hate"
date: 2023-06-09
published_on: "09th June, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-06-09-things-code-reviewers-hate-cover.jpg"
categories: code-review development frustration
excerpt: Is reviewing code part of your daily job? Unless you've got a super nice team (that doesn't actually exist), you must have faced most of these aspects while reviewing your peer's code.
---

![cover-photo](/blog/assets/images/2023-06-09-things-code-reviewers-hate-cover.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"
}

Photo by <a href="https://unsplash.com/@punttim?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Tim Gouw</a> on <a href="https://unsplash.com/photos/1K9T5YiZ2WU?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

Is reviewing code part of your daily job? Unless you've got a super nice team (that doesn't actually exist), you must have faced most of these aspects while reviewing your peer's code. Although I'd completely agree that I must have done submitted this kind of code when I was junior, hence the karma!

On an average, I review about 6-8 pull requests on a daily basis. Some PRs require my approval because of Github code owner rules, while rest of them are raised by my team members. Every few days, the developer inside me is hurt because of the code I get to see. Few of these points are related to pull requests, while some are generally related to writing good code. These are the top few things I hate:

1. **Long pull requests** - There are plenty of reasons why our PRs should be short but here I'd share my perspective as a code reviewer only. When I look at long PRs, I'm not able to understand what we're trying to do as a whole and why did we not break this change into parts. Let's agree for a second that this PR is doing one dedicated task so it should be ok to accept this, but if I give 10 CR comments, and developer fixes 8 of those, and justifies rest two, I'd need to again look at the long PR again to see what fixes were done and how it impacted overall code. Incase multiple cycles of review happen, my context for this PR is so large that I'll be lazy to pick this for another round of review. Even as a developer also, you need to test the entire code again because code changes with respect to 8 comments might have impacted some areas. So basically, it doesn't benefit anyone. Although it sounds tough to break changes into parts, but trust me, that's what a good developer is expected to do. Also, please note that there is no definition of "long" PR. As a developer, we should try to break changes into as many shippable chunks as possible.

2. **Missing minimum information** - PR title and description should mention the brief scope of change. Although this is standard across many companies, still many developers forget to do this sometimes. Asking for a code review without much information is very unproductive for the reviewer. They should not be expected to ping you, or find the JIRA ticket themselves, or magically understand the scope by reading the code. At LocoNav, we have a simple convention of putting JIRA ticket ID in the PR title first, followed by brief description of change. Although requirements and scope of change is mentioned in detail on the JIRA ticket, but some developers optionally mention a summary in description section of PR.

3. **Untested code** - I feel my time is wasted on code review if I see a piece of code with a logical error in it. This
means the developer didn't bother to test the code locally before raising the PR. This is the worst you could do to respect someone's time. Some developers think we'll test the code later (on staging environments) and they raise the PR first. But they forget that doing QA and catching such bugs is not the scope of reviewer (although we do it sometimes). If we approve this code, and it breaks on further environments, we'll again have to review the same after the developer fixes this code.

4. **Non-Linted code** - There are all sorts of tools people use for development. From simplest text editors like Sublime and VSCode, to complicated and heavy IDEs like IntelliJ and RubyMine. Almost all tools have configurations that you can setup to lint your code properly. Infact, linting should never be done by hand as it is a task that can be easily given to our editor. Common things include proper spacing & indentation, no trailing whitespaces, no extra new lines. Beyond this, there could be language specific rules. Please always lint your code properly before submitting for a CR. For me, it's a turn off to see non-linted code and I don't shy away to give comments like "Please use space on both sides of equals operator".

5. **Repeated mistakes** - Unless your organisation has high attiration rate, or is shuffling people across teams frequently, you must be working with the same set of people for a long time. We know how someone is growing. In the beginning people do all sorts of mistakes and get many review comments but that generally improves with time. Frustration kicks in as a reviewer when people don't improve on same set of mistakes.

The next two points are more related to writing good code, but still listing them down here as they are related to PR reviewer's experience also:

6. **Poorly organized code** - We need to ensure that low level design of our module is good and our classes & interfaces are separated nicely. Although this could be a wide separate discussion but in brief we should ensure small classes, each minding it's own business and not strongly coupled with other classes.

7. **Catching Top level exception classes** - We often write long methods that could possibly throw a lot of exceptions, and later we just wrap the entire method's code in a `begin...rescue` (or `try...catch`) block with exception superclasses (like `StandardError` or `Exception` class in Ruby and `Exception` class in Java). Doing this is so risky that it could be a complete post of it's own. [This stackoverflow answer](https://stackoverflow.com/questions/10048173/why-is-it-bad-style-to-rescue-exception-e-in-ruby) describes the issues for Ruby language, but those are conceptually applicable to all languages.

So next time you plan to raise a PR for review, I'd recommend you to consider atleast these points (although there are many more). I prefer to self-review the PR first before submiting it further to ensure that there are no obvious mistakes or debugging messages left. This small habit can help reduce to and fro between you and the reviewer, and improve feature delivery speed.

Thank you for sparing time to read this. See you later!
