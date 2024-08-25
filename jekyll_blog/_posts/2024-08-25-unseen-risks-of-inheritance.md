---
layout: post
title: "Unseen risks of Inheritance"
date: 2024-08-25
published_on: 25th August, 2024
author: Gagandeep Singh
cover: "/blog/assets/images/2024-08-25-unseen-risks-inheritance.jpg"
categories: inheritance oops design
excerpt: I started learning Object-Oriented Programming (OOP) with C++ during my college days, and Inheritance is one of the key concepts you can't miss when learning OOP. In fact, inheritance is one of the four core principles of OOP, along with...
---

![cover-photo](/blog/assets/images/2024-08-25-unseen-risks-inheritance.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"}

Photo by <a href="https://unsplash.com/@flyd2069?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">FlyD</a> on <a href="https://unsplash.com/photos/text-5lU_WmKVus4?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
{: style="text-align: center;font-size: 0.8em"}

## Background

I started learning Object-Oriented Programming (OOP) with C++ during my college days, and **Inheritance** is one of the key concepts you can't miss when learning OOP. In fact, inheritance is one of the four core principles of OOP, along with **Encapsulation**, **Abstraction**, and **Polymorphism**. In our textbooks, the examples of inheritance were quite simple. The one I remember involved a `Shape` class, where classes like `Circle`, `Square`, and `Rectangle` inherited from `Shape` and override the `area` method. Unfortunately, real-life classes are never that simple 😄.

## Problems with Inheritance

I have written a significant amount of code using the Inheritance pattern, which complicated the overall design of my system over time. A common issue was that many classes in the hierarchy contained methods that were not useful to them. These methods were inherited from somewhere in the inheritance chain. This problem often arises when you use this pattern early in the design and fail to refactor the design when things become more complicated. So basically, if you stick with the design and keep adding more behavior to the classes without rethinking the design for new requirements, you'll end up with the same problem. As a result, your classes might have methods that don't make much sense for them. A few other problems that come with Inheritance are:

1. **Tight coupling** - Inheriting classes from each other inevitably increases coupling. While changes in a subclass do not affect the parent class, the reverse is not true. In a lengthy inheritance chain, any modifications to the base class design can impact all subclasses.

2. **Long chain -** Inheritance is beneficial only when the chain is kept short. In a long chain of classes, it becomes challenging to trace the origin of method definitions and understand where they are overridden. Such a design complicates debugging and maintenance.

3. **Rigid design** - Because of the coupling introduced by inheritance, the design becomes less flexible and more rigid. When you make modifications to the base class, these changes can unintentionally affect all derived classes. This can lead to unexpected bugs or require changes in multiple places throughout the codebase.


## Why people still use it?

We all know that **low coupling**, **ease of debugging** and **flexibility** are the traits of a good design. So why should we use Inheritance if we do not get all of this? The answer to this is **—** Inheritance is beautiful, only if you know how to do it nicely. For example, the Java's collection framework hierarchy neatly implements inheritance:

![Java collections framework - Wikipedia](/blog/assets/images/2024-08-25-unseen-risks-inheritance-java-collections.jpg)

The above design is better because:

1. **Clean Abstraction** - It uses abstract classes and interfaces. Your language might not provide the same functionality (e.g., **Ruby** doesn't have **interfaces**), but the general idea of breaking down the functionality should help.

2. **Refactoring** - They clearly define the role of each level, and they have been heavily refactoring the hierarchy since the collections framework was released in 1998.

3. **Design Patterns** - Beyond just inheritance, the framework also uses some design patterns internally to simplify the design.

4. **Inheritance Chain** - Although there is no strict rule on how long or wide your inheritance hierarchy should be, it's good to keep an eye on it so you don't end up with 10-20 levels of inheritance.


Beyond these points, the classes in the Java collection framework adhere to the SOLID principles, which are crucial for maintaining a robust and flexible design.

## Clean Inheritance

There's an excellent talk by [Sandi Metz](https://sandimetz.com/) from RailsConf 2014 ([link](https://www.youtube.com/watch?app=desktop&v=8bZh5LMaSmEhttps://www.youtube.com/watch?app=desktop&v=8bZh5LMaSmE)) where they explain how they refactored a code with high cyclomatic complexity to a much simpler design using Inheritance. While they are on it, they also explain when inheritance is good. Quoting from the same talk:

*Despite of what you have have heard, Inheritance is not evil, and I can tell you exactly when it's safe to use it. Here's what you want - You want a shallow, narrow hierarchy. You don't want it to be deep, and you don't want it to be wide, alright? If that's the problem you have, there's no better solution that inheritance and you're free to use it. Inheritance is not, evil but sometimes we are.*

Although I've provided the gist of the talk in context of inheritance, there are a lot of other good things that you can learn from the talk, so you must watch it.

## Other patterns

I also wrote a bit about the use of design patterns in the Java collections framework. That's something I'd like to explain further. As a developer, you should always look for better ways to write cleaner, simpler code. So beyond inheritance, try these things:

1. **Small classes** - The entire idea of maintainable software comes from writing small, extensible classes that can work together to complete a task. Make sure that your classes do a single task nicely. If you feel that the new requirements are leading to some bloat in the existing class, plan to refactor it rather than adding behaviour that doesn't belong to it. I'll touch on *refactoring safely* in my next blog.

2. **Design patterns** - There's nothing new that I'm suggesting here. It's important for all engineers to read about design patterns at least once so that you do not make the same mistakes that these patterns solve. I've personally found [this website](https://refactoring.guru/design-patterns) excellent for design patterns (and [code smells](https://refactoring.guru/refactoring/smells)) but it's ok if you've read [GOF](https://www.amazon.in/Design-Patterns-Object-Oriented-Addison-Wesley-Professional-ebook/dp/B000SEIBB8) or some other book. I've personally used Facade, Adapter, Decorator, Proxy, Strategy and a few more design patterns in my projects to simplify the design.

3. **Composition over Inheritance** ([more here](https://www.geeksforgeeks.org/favoring-composition-over-inheritance-in-java-with-examples/)) - A lot of code that we write using Inheritance can be simplified using Composition pattern. By composing objects from simpler, reusable components, you create more flexible and maintainable code. Composition allows you to change or extend behaviours dynamically without altering existing code, unlike inheritance that leads to rigid hierarchies and tight coupling.


## Conclusion

While inheritance has been a cornerstone of Object-Oriented Design, it's important to recognise its limitations and explore alternatives that offer more flexibility and maintainability. As your software evolves, adopting these approaches can lead to more maintainable code.

