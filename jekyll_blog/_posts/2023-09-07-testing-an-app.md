---
layout: post
title: "Testing an app"
date: 2023-09-07
published_on: "07th September, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-09-07-testing-an-app.jpg"
categories: development process testing
excerpt: For many entry-level developers, the most exciting part of work is writing a shiny new feature, while rest of the things sound boring. Although writing code seems more than 90% of the work to them, but it is not true.
---

![cover-photo](/blog/assets/images/2023-09-07-why-write-tests.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"}

Photo by <a href="https://unsplash.com/@homajob?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Scott Graham</a> on <a href="https://unsplash.com/photos/5fNmWej4tAA?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

For many entry-level developers, the most exciting part of work is writing a shiny new feature, while rest of the things sound boring. Although writing code seems more than 90% of the work to them, but it is not true. Typically, engineers are involved in:
1. **Requirement feasability** - Along with product, design, business team(s).
2. **Estimation** - Giving ballpark/detailed estimates based on approximate/exact requirements.
3. **Design** - Building the technical design (LLD/HLD), finding out cross team dependencies, etc.
4. **Code** - The implementation (_most exciting one_).
5. **Dev testing** - Devs should test their solution using manual and automated tests.
6. **QA Testing** - QA team should also test the application using tools like Postman and also end to end testing on frontend (if available).
7. **Documentation** - Making or updating technical documentation.
7. **Communication** - Supporting other engineers for integration, attending scrum calls, updating everyone on status of things and blockers (if any).
8. **Post release support** - Error monitoring, performance monitoring, support for bug-fixing, etc.

Seeing the above can seem overwhelming, but this is what happens in real world projects. Also, it can now be said that implementation is probably not even half of the total time or effort. You might be thinking - **what's here to talk specifically about test-cases?** Testing is one of the most under-rated bit of SDLC. Although it is very obvious to test your product before delivering to the end user, and testing happens everywhere, but the emphasis of this post is on importance of testing in the overall framework.

Just to explain - *testing is not when your developers give the product to your QA team and they start testing*. Testing should be hooked in your framework at various levels:
1. When a story is being discussed between product and tech team(s), the QA team should also be part of discussion and they should understand the product to write test scenarios.
2. Everyone should go through the test cases to make sure nothing is missed.
3. Product team should make sure that product and design have handled all the cases in the product as mentioned by the QA team.
4. Developers should make sure that their design covers all of these scenarios.
5. Once development is complete, developers should manually test their code through some interface to make sure all these cases are covered. Later, they should add automated test cases for all the cases.

From my experience, the above is a rock solid way to ensure that:
1. Everyone is on same page in understanding the product and possible scenarios.
2. Feedback from everyone is incorporated as early as possible.
3. Testers start documenting the test cases even before developers write code, avoiding the need of design change in the later phase(s).
4. Cost of change is minimum and delivery is fast (due to 2 and 3).
5. It is easy to see which layer missed the test case(s) and caused a specific bug, which otherwise can become a blame-game within the team.
6. Above all, team motivation is maintained.

---
{: style="margin-bottom: 10px;"}
Although above section talks about the impact of good testing framework for the entire lifecycle, I'd also like to talk about how a good test suite helps developer teams:

1. **Language and Framework version upgrades** - I've got to work on Ruby and Rails upgrades multiple times in my career. One of the primary requirements for such upgrades is to have a **good test coverage**. If you don't have one, you'll need to get your app deeply tested. Although you'll do that otherwise also, but having a good test suite adds to the confidence and helps to show a lot of issues early.
2. **Database version upgrades** - Same thing applies here also. Although for upgrading database versions, people generally dump a production snapshot to a new instance (to see if data and extensions are compatible with the next version), but a test suite would add to the confidence here also.
3. **Feature enhancements** - Often the first version of the application is released as a small product to gather customer feedback. While building the second version, there can be both incremental changes and some changes in the existing product. At this point, we need to ensure that existing functionality doesn't break, and automated test cases help to ensure the same.
4. **Refactoring** - Refactoring is inevitable part of maintenance phase. You'll find need to refactor a lot of things that might be written in an inefficient manner due to deadlines or other reasons. Without test cases, refactoring can easily mess up the code and introduce bugs.
5. **Enforcing Better low-level design** - It's very common for developers to write long methods and classes, spanning hundreds and thousands of lines. Such classes contain model layer, service layer, external API calls, and many other things coupled together. When you write unit tests, you often mock some part of the code to test the other independently, but when it is hard to write tests of a specific class or method, there are high chances that your structure is not good. In order to write tests efficiently, you'll often end up splitting the class (this realization comes by some practice). Follow the rule - *If it is hard to write tests, better refactor the code for which you're writing tests.*

Testing is a serious business. Think of any product you use - if you get a good user experience, there are high chances that it is an outcome of a good process and a lot of testing. Everyone wants their product to get loved by their users, but few are willing to invest substantial effort in the testing and in improving the overall delivery process. To build a better product, hook the testing in your overall development cycle, not just in the end.



Take care and see you guys in the next post.


