---
layout: post
title: "'Classify' Your Codebase"
date: 2023-06-20
published_on: "20th June, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-06-20-classify-your-codebase-cover.jpg"
categories: modularity low-level-design maintainability
excerpt: Most of the software engineers have a strong (theoratical) grip on OOPs concepts right from the college days but few still struggle to apply them while working. If you are someone who see a large number of small classes in your codebase that are well...
---

![cover-photo](/blog/assets/images/2023-06-20-classify-your-codebase-cover.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"
}

Photo by <a href="https://unsplash.com/@chuttersnap?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">CHUTTERSNAP</a> on <a href="https://unsplash.com/photos/7eQlPra81zQ?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

Most of the software engineers have a strong (theoratical) grip on OOPs concepts right from the college days but few still struggle to apply them while working. There was a time in my career when I realized that my code is doing everything it is expected to do but I was unhappy with how it looked. I have written methods that were even 200-300 lines long, and classes 1000 lines long. But today if I see any such code, I call it **unmaintainable** and **untestable**. In this post, I want to share one thing that helped me transform my mindset, i.e. **The power of small changes**. It took me months to understand how this habit is more impactful because earlier I thought this is counter-productive.

Few years ago, I worked on upgrading Rails major version of a monolith project (an app that powers most of LocoNav website). Most of the changes here were pushed in one large pull request (_100+ commits, 270+ file changes, 1300+ additions, 1600+ deletions_, all by just me). Although it didn't break anything related to code on production, but I was quite nervous at the time of release. No one even reviewed this PR much because it was hard to review (as discussed in the first point [here](https://gagan93.me/blog/2023/06/09/things-code-reviewers-hate.html)). Also, I found out that while raising large PRs worked for me, it did not scale for my team. Many such PRs sent by others caused production bugs.

We had a senior engineer who always advocated for small PRs and slowly I got influenced to follow the same. Being in a startup environment, we had to be fast enough in terms of delivery, so the main concern was - _How can we break changes into small parts and still deliver fast?_. We started looking in the PRs on how we were organising our classes. We found out that we're mixing a lot of responsibilities and not following SOLID principles at all (forget design principles!). You might think that I'm mixing basic OOPS with SOLID and other design principles (eg. prototype, builder or composite). But if you think carefully -- it's all about creating small classes that can talk to each other to complete a task. Let's talk about a simple inheritance example that we studied during college days (code sample is in Ruby but should be basic enough to understand):

```ruby
class Animal
  def eat
  end

  def sleep
  end
end

class Dog < Animal
  def bark
    puts "BARK!"
  end
end

```

Here, we clearly see that one class is doing one task (just defining a specific Animal, or adding more behaviour in subclass). Now let's move to a real-world example of processing an order on an ecommerce website:

```ruby
class Product < ApplicationRecord # Inheriting from ApplicationRecord means this is a model ('M' in MVC)

  def sell
    check_inventory
    apply_discount
    make_bill
    process_order
    send_to_dispatch_team
  end

  def check_inventory
    # logic here
  end

  def apply_discount
    # logic here
  end

  def make_bill
    # logic here
  end

  def process_order
    # logic here
  end

  def send_to_dispatch_team
    # logic here
  end
end
```
There are multiple questions that come to my mind when I see such a code, but the fundamental one is - Why did we keep this method (and all it's associated methods) inside a model (or inside one class)? While this might look simple for once, it is doing a very complicated task. It's clearly visible that we might be calling other services or a payment system while processing an order, and hence any step can fail. There seems no defined way to rollback the previous steps if any step fails. And if we want to build such a process, would we want to put those methods also in the `Product` class? (The above code is influenced from _Fat models Thin Controllers_ philosophy).

# The Answer
What do you think? Should you take a course on Design Patterns in order to refactor this? Few months ago I read a [book](https://refactoring.guru/design-patterns/book) on the same, and I'm sure that there are a lot of improvements we can do before applying design patterns.  Developers often shy away from doing this but the only solution to have a maintainable codebase is to **break such classes**.

Whenever you see a logical chunk in a class, that is not related to rest of the code and can be taken out, please take that out. We often think that we can do all this later, but that time never comes till we see some serious issues with the code. Due to this delay, the methods inside the class become more coupled to each other and the effort of taking that out becomes much larger. The above is a very simple example where you could have a plain ruby class ([PORO](https://sulmanweb.com/plain-old-ruby-objects-poros-in-rails-fat-models/)) called `OrderProcessingService` that has all the business logic for processing an order. And obviously, if needed, we'll have more classes for performing other steps (checking inventory, applying discount, etc). It's good to know about SOLID Principles and Design patterns, but at the end of the day you see - it's all about distributing responsibilities, reducing coupling and creating more (small) classes. If you know how to apply this, you can apply design patterns as well. Otherwise everything is theory!

So the next time you see yourself or a colleague writing methods in a class that should be separated out, please make sure you do that. That will pay you in future 😀. Another way of knowing about your code's health is to write test cases for it. If it's easy to write test cases for a class without mocking a lot of things (except external services), then it's ok. Otherwise you might want to refactor your classes. Happy coding!
