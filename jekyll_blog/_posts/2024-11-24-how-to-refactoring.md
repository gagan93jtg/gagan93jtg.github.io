---
layout: post
title: "Refactoring: Lessons Learnt So Far"
date: 2024-11-24
published_on: 24th November, 2024
author: Gagandeep Singh
image: "/assets/images/2024-11-24-refactoring.jpg"
categories: refactoring design rewrite
tag: featured
excerpt: This post debunks myths about refactoring, differentiates it from rewriting, and offers practical guidelines. It emphasizes continuous improvement, testing, and documentation to foster a positive engineering culture and sustainable software development.
---

Photo by <a href="https://unsplash.com/@nina_mercado?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Nina Mercado</a> on <a href="https://unsplash.com/photos/silver-and-black-round-coins-5Y8NrzPya-w?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

## Background

> Refactoring is the process of restructuring code, without changing its original functionality.


Over the past three years, my role has allowed me to pick a lot of refactoring tasks, which have enhanced my skills and understanding around *Refactoring*. Despite its proven benefits, many developers and teams approach refactoring with hesitation, weighed down by myths that it is **risky, time-consuming, or equivalent to a complete rewrite**. However, refactoring is none of these. When done correctly, it can significantly reduce technical debt, improve readability, enhance test coverage, and simplify debugging.

This blog aims to demystify refactoring by exploring its importance, addressing common misconceptions, and providing practical guidelines for approaching it the right way. Whether you’re tackling a legacy codebase or refining new code, understanding the essence of refactoring can empower you to build more sustainable software. Let's delve into **why** and **how** refactoring should be a regular part of your development process, not an intimidating task.

## Why should you refactor code?

After nearly a decade of writing software, I've learned that **refactoring is unavoidable**. While it's possible to delay it, putting it off only makes the task costlier and more complicated down the line. Ignoring refactoring may offer short-term relief, but in the long run, the cost of addressing the accumulated technical debt grows exponentially.. The below points should help you understand why you need to prioritize refactoring regularly:

### To untangle Code Ownership

One common complaint among developers working in a *fast-paced* startup environment is that the code for different modules often becomes tightly coupled, sometimes even within a single file. This situation arises because, in the beginning, the business logic is straightforward. Each time a developer needs to make a change, they perceive it as *just another simple change*. Over the years, this approach results in a file that resembles a [god object](https://en.wikipedia.org/wiki/God_object), which seems to know everything but has lost sight of its original purpose. Refactoring plays a crucial role in untangling this complex web of code. By doing so, it allows different teams to take ownership of specific files or modules. This can be effectively managed using tools like [GitHub CodeOwners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners), which help assign responsibility and maintain clarity in code management. Through refactoring, the codebase becomes more organized, enabling teams to work more efficiently and reducing the risk of errors when changes are made.

### To reduce cost of debugging

Recently, I was on a call with another engineer, and we were trying to find problem in the production code. A section of the application wasn't functioning correctly, so we started by reading the code starting from the controller to trace the potential path a user might have taken. The controller file was cluttered, containing most of the business logic in one file. It was filled with numerous methods that called one another, each with lengthy lists of arguments that were difficult to guess. We spent over an hour trying to pinpoint the issue, but even after all that time, we weren't entirely confident about the root cause. Having dealt with debugging production issues in the past where the code was better organized, I realized that these engineers were losing countless hours every time a problem like this came. If you find yourself in a similar situation where valuable productive time is being wasted on debugging due to tangled code, it's crucial to have a conversation with your managers. Discuss the importance of planning for refactoring in the future. By doing so, you can improve the code structure, making it easier to identify and fix issues, ultimately saving time and resources in the long run.

### To reduce techical debt

> Technical debt is the cost of future rework that results from prioritizing speed over long-term design in software development.

Companies often ship code that needs more work before adding new features. While launching the initial product is the top priority, addressing tech debt often gets delayed. For example, when working on a new module, you might hardcode values in an existing class. As more requirements come in, adding more hardcoded values or if-else statements just creates a mess. This means you need to refactor the code before building more on it. Remember this quote: [*First make the change easy, then make the easy change*](https://news.ycombinator.com/item?id=33059910).

### To improve engineering culture

The cleaner and more well-structured your code is, the better it becomes as a reference for others. When you take the time to improve and maintain high-quality code, it not only benefits the project at hand but also sets a positive example for the rest of the team. New team members will be motivated by its clarity and organization, inspiring them to adopt similar practices in their own work. This fosters a culture of excellence, where everyone strives to write better code. On the flip side, if the codebase is cluttered and unorganised, there’s a high likelihood that others will follow that same pattern and create similarly messy code. It becomes a cycle, where poor practices multiply. As the team grows, this culture of quality spreads, impacting the overall productivity and the risk of technical debt based on the shape of initial code.


The habits you instill in your codebase today can shape the quality of work throughout the entire team tomorrow. Before we learn how to refactor, let's clear up some myths about refactoring.

## Myths around refactoring

### It’s another name for “Rewriting”

Before we talk more about refactoring, it’s important to understand basic differences between *Complete Rewrite* and *Refactoring*:

| **Aspect** | **Complete Rewrite** | **Refactoring** |
| --- | --- | --- |
| **Scope** | Entire codebase is discarded and rebuilt. | Improves the existing code incrementally. |
| **Risk** | High risk of introducing new bugs or missing features. | Lower risk as existing functionality is preserved. |
| **Time & Cost** | Time-consuming and often more expensive. | Typically faster and more cost-effective. |
| **Goal** | Start fresh with a new design or approach. | Improve code quality, maintainability, and performance. |
| **Disruption** | Can cause significant disruption to development and team workflow. | Less disruptive, as changes are small and incremental. |

I've seen developers (of all experience ranges) raising PRs with thousands of lines of changes across multiple files, claiming they've “tested everything thoroughly”. They think this one PR will solve all their problems, but that's rarely true. In most cases, the real issues begin after merging the PR. Don’t take this negatively if you’re following the same approach currently. Even I've been that developer who has merged large PRs without breaking anything on production, and I've seen others do it too, because they took the mental stress of testing every case and fixing all review comments on the large PR (and again test everything). The only problem with this approach is that **it doesn’t scale** for everyone in the team. While everyone can raise large PRs,

1. Not everyone can **test** them thoroughly. And even if they do it once, they don’t do it with the same effort after fixing the review comments where they might have changed something in logic or in design.

2. Also, not everyone can **review** large PRs. As a result, many such large changes go live without a good code review. In my experience, reviewing large PRs can easily take more than an hour and not everyone is ready to put that much effort. These days I often don’t review large PRs. I spent ~ 5 minutes in understanding the structure of changed files and then leave a comment suggesting how the author can raise smaller PRs that are easy to review.


Due to how developers have been approaching "refactoring", management and leadership have started seeing it in the same way as "rewriting." While raising a large PR for a new feature is safer (since most of the code is new), it is considered very risky for refactoring. If your code change breaks a stable module in production, it will confirm your manager's belief that *refactoring is as risky as rewriting*. So, make sure you avoid the “big bang” approach.

### It’s meant for legacy applications

Refactoring is linked to **legacy systems** because legacy systems often accumulate large technical debt over time, but it's just as important for **new and evolving applications**. Even in modern codebases, you can gather small debts like long classes/methods, duplicate code, unclear variable names, etc. Refactoring lets developers improve and optimize code continuously without a major overhaul. I often refactor code I wrote last week or last month. When a change makes a method or class messy, I find better ways to rewrite that code. It gives a different kind of satisfaction 😌.

### It’s risky, hard and unscoped

The favorite thing for an engineer to do is build new features. The second favorite (for a lot of us) is doing a big-bang rewrite of an old system. But there are two issues with large rewrites:

1. They have more chances of breaking production because of size of change.

2. They have less chances of getting shortlisted by your manager, again, because of it’s size. And because such tasks do not create any immediate business value, they gets shelved.


If your manager has been a Senior IC person in the past, there might suggest you to split the project in order to get it prioritized. But if they are someone who’s not much into tech these days, and they do not suggest something like this, your refactoring project won’t get picked ever. So irrespective of how **technical** your manager is, it’s your role to understand the scope of the project and break it into parts that can be shipped. If you’ve never done it, please start doing it from now. Shipping new features can go in large PRs (although I don’t recommend you doing that) but refactoring projects should **never** go as large PRs. And because many developers have been executing them wrongly, refactoring is seen as **risky, hard and unscoped**.

### It’s a one time event

A significant amount of technical debt shows that your team hasn't focused on refactoring for a long time. If you compare the cost of refactoring a system today with the cost three years from now, you'll see that doing it today is easier and cheaper (unless the product is being retired in the next three years). This is because if experienced team members leave, new ones will struggle to understand the messy code that has built up over the years. Refactoring is a skill that everyone develops over time. Once you successfully complete a small refactoring project, you gain the confidence to handle more tasks and improve the system further. As you master this skill, it's important to share your knowledge with others, so everyone can help improve the existing codebase. Ideally, refactoring shouldn't be something you do only once or twice a year. It should be a **continuous** and **intentional** effort to keep technical debt from becoming too much to handle.

### Refactoring is “moving code across files”

> “Don't mistake motion for progress" - Alfred A. Montapert

In web applications, there is a common principle that your controllers should remain small and focused. This means they should primarily call the service layer and handle the response based on the service's output. As a result, developers who find themselves writing extensive code within controllers might feel compelled to move that code elsewhere. While this instinct is understandable, it is crucial to approach this task with careful consideration and planning. Instead of simply *cutting and pasting lengthy methods* from one file to another, which only addresses the superficial goal of reducing controller size, a more thoughtful strategy is required. True refactoring involves a deeper analysis of each method's purpose and determining the most appropriate location for it. This process requires developers to think critically about the design and structure of their classes, ensuring that each method is placed in a context where it logically belongs. By engaging in a well-planned refactoring activity, developers can achieve more than just *smaller controllers*.

I believe you now have a solid understanding of what refactoring is—and what it isn’t. Now, let’s dive deeper into how to approach refactoring and explore the key challenges to watch out for during the process.

## Approaching Refactoring

### It is done in isolation

When someone is working on a feature, they’re often motivated to fix the code around it. As a result, we get to see PRs where someone lints an entire file rather than the method they changed, or improved the logic of the methods that is getting called from their code. Their intention is to improve or optimise the code but the change could probably be taken up in a separate PR. Just like you don’t mix **drinking** with **driving**, avoid mixing **feature changes** with **refactoring.** Make sure that if you want to do the noble act of improving the existing code, raise a separate PR for it so that it can be individually tested, reviewed and released (and even reverted, incase something goes wrong). This will ensure that your **feature changes** do not get blocked due to review comments on this **refactoring changes**.

### It should be guided by tests

Test cases are incredibly important when you are refactoring any part of a system. They serve as a **safety net**, ensuring that the changes you make do not unexpectedly break an existing functionality. For example, if you have a comprehensive set of unit tests for a large file, these tests can guide you through the process of splitting the file into smaller, more manageable pieces. With unit tests in place, you can confidently refactor, knowing that any errors introduced during the process will be quickly identified. This allows you to focus on improving the code's structure and readability without worrying about unintended side effects.

**What if I don't have test cases for some code? -** Incase you don’t have test cases, I recommend building a strong automated test suite first, or find ways to manually test the system to confirm everything works after refactoring. Please do not prioritize refactoring without a good way of testing out changes. I've been moving code from controllers to services, and from large services to smaller, more manageable services using this approach. I make sure my controller tests cover 100% of the controller and service code. Once that's done, I know that any changes I make will be caught if they break any part of the API contract.

### Refactoring should use established patterns

While many believe that code is poetry — and I wholeheartedly support the idea of creative problem-solving, it's equally important to follow established patterns and best practices when refactoring code. These patterns have been developed and refined by the community over decades of experience while solving similar problems. They encapsulate lessons learned from solving common challenges, ensuring solutions are robust, efficient, and easier for others to understand. Established patterns, like **design patterns** (e.g., Singleton, Strategy, Factory), **architectural styles** (e.g., modular monoliths, microservices), solutions to [**common code smells**](https://refactoring.guru/refactoring/smells) (like long class, long methods, data clumps), and practices specific to a **language** or **framework** act as a shared vocabulary among developers. When you follow these patterns, you're not just solving a problem, you’re solving it in a way that others can immediately recognize, adapt, and build upon. This reduces cognitive overhead for team members, accelerates onboarding, and improves collaboration. While building a solution in way that it feels “uniquely yours” is a tempting feeling, these (overly creative) solutions can become difficult for others to maintain, debug, or extend over time. By grounding your refactoring efforts in proven patterns, you ensure the code remains accessible and future-proof.

### Avoid Premature abstraction

Abstraction is a great concept, but premature abstraction makes things complex. A [common rule](https://en.wikipedia.org/wiki/Rule_of_three_\(computer_programming\)) in software engineering suggests to avoid having an abstraction till there are at least **three repetitions** of the code fragment that you’re planning to abstract out. While “three” might not be an appropriate number for everyone, it should be a good starting point for you if you don’t have anything else in mind. Waiting for a few repetitions of the code ensures that you have some data around what to generalize and what not to. While duplication of code is considered bad, generalizing prematurely might lead to speculative designs that are very different from the real world needs. Write code that is clear, direct, and solves the immediate problem effectively. Refactor and abstract **only when** the need becomes evident—when similar patterns emerge across different parts of the system, or when a particular piece of functionality needs to be reused or extended.

### Keep changes small and reversible

I think we’ve already discussed about the benefits of small PRs, so keeping the changes **small** is an obvious thing. Another important thing is to ensure that changes are **reversible**. As refactoring can touch very critical parts of your application, it is important to **plan for failure**. The simplest *rollback plan* would be to turn off the feature flag incase something goes wrong (or rollback the previous release). But that only works for deployments that didn’t modify any data. If you’ve modified some data in your database, it might be hard to rollback. As a precaution, try to follow an approach where rolling back data changes is also easy. For example, split your deployments like this:

1. Add a new column that has new data. Push the new code along with this but don’t flip the feature flag yet.

2. Back populate the data in new column and add relevant callbacks in the system to ensure new data gets copied.

3. When previous data is also copied, flip the feature flag and see if everything is going well. If something goes wrong, immediately turn off the feature.

4. After few weeks/months (based on amount of testing you need), drop the old column, delete the old code and drop the if-else code handling the feature flag.


Based on the scale of data and complexity of project, the above approach can sound normal or an overkill to you. But trust me, I’ve seen things going wrong just because developers didn’t plan well for rollbacks for **data related changes.**

### Document changes

Documenting changes during refactoring is essential for maintaining clarity, ensuring team alignment, and supporting future development. It captures the **rationale** behind the changes, helping others understand why specific decisions were made, especially if they impact dependencies or architectural patterns. Documentation preserves **context** to avoid undoing improvements and provides a historical record for long-term projects. It also simplifies onboarding by giving new team members a clear view of the code's evolution. Good documentation highlights **what was refactored, why it was needed, and how it aligns with the project's goals**, helping avoid confusion and duplication of effort. Including notes in commit messages, pull requests, or internal wikis ensures the refactoring's intent is communicated effectively. This practice not only fosters collaboration but also aids debugging by clarifying the purpose and impact of the changes, ensuring the refactored code remains accessible and adaptable.

### Monitor performance, check for bugs

When refactoring, it's crucial to **monitor performance** and **check for bugs** to ensure stability and identify unintended side effects. While refactoring doesn’t guarantee performance improvements or fewer bugs, it can pave the way for these by simplifying the codebase and addressing inefficiencies. A well-refactored codebase should also make future optimizations (such as adding a caching layer) easier to plan and implement. Additionally, cleaner code helps in debugging and enhances maintainability (as already explained above). Use comprehensive test suites to validate changes and check for regressions and APM tools to monitor real-world performance after deployment.

### Value contributions

This message is for team leads and engineering managers: one of the most common reason why developers struggle with refactoring tasks is **a lack of motivation**. And often, this lack of motivation comes from how teams undervalue **refactoring** compared to **business deliverables**. As Eileen pointed out in her [latest RailsConf talk](https://www.youtube.com/watch?v=olxoNDBp6Rg), a good engineering culture starts at the top. Many of us have worked at organizations where messy code is shipped in the name of urgency, and the architecture becomes too complex to maintain over time. If we’re to take actionable insights from her experience, here’s what leadership can do to address these challenges:

1. **Prioritize Refactoring -** Treat refactoring tasks with the same importance as product development. Assign dedicated bandwidth for these efforts. Spending “few hours a day” don’t work and often lead to half-hearted results.

2. **Align Teams** \- Ensure engineers, product managers, and other stakeholders understand that refactoring is just as crucial as building features. A healthy codebase supports long-term business goals.

3. **Invest in Education -** Not all team members naturally excel at refactoring. If specific skills are needed to address technical debt or architectural issues, invest time and resources to train your team.


Eileen, with over a decade of experience at companies like Basecamp, GitHub, and Shopify, emphasized these points from her journey. While I haven’t worked at large organizations, I’ve faced similar challenges in small-to-medium startups. And seeing the comments on her talk, these problems persist even in teams following microservices architecture. So we can conclude that the challenges of maintaining a clean, scalable codebase are universal.

# Conclusion

While refactoring is essential for maintaining a clean and efficient codebase, it's important to respect the existing code, even if it appears messy. This code was often written under tight deadlines to meet urgent business needs, and it has successfully supported the business for **months and years**. Recognizing the value of this "mess" is crucial, as it reflects quick thinking of developers who ensured the continuity and success of the business, which is crucial for any organisation.

Thank you for reading this post, have a good day 😊.

## Further reading

1. If you’re not yet thorough with design patterns and code smells, use this [free resource](https://refactoring.guru/).

2. Read [this post](https://newsletter.pragmaticengineer.com/p/paying-down-tech-debt) by The Pragmatic Engineer around tech debt.

3. Find a book around refactoring for your specific programming language. For example, I read [this book](https://www.amazon.in/Refactoring-Ruby-Addison-Wesley-Professional/dp/0321984137) for Ruby.

4. I already linked [this talk](https://www.youtube.com/watch?v=olxoNDBp6Rg) in one of the points above, but adding this again incase you missed that!
