---
layout: post
title: "Problems with generic code"
date: 2024-09-22
published_on: 22nd September, 2024
author: Gagandeep Singh
cover: "/blog/assets/images/2024-09-24-generic-code.jpg"
categories: generic-code refactoring solid
excerpt: I try to explain the pitfalls of overly generic code and why it's beneficial to avoid it.  I share my experiences and lessons learned over the years. I explain how generic code can become a maintenance nightmare in the long run..
---

![cover-photo](/blog/assets/images/2024-09-24-generic-code.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"}

Photo by <a href="https://unsplash.com/@kierinsightarchives?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Kier in Sight Archives</a> on <a href="https://unsplash.com/photos/black-and-white-heart-sketch-4bhhwmsYl-c?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

## Background

I’m a Senior Engineer with nearly 9 years of experience in the software industry. In one of my previous projects, I had to migrate the background job processing engine of a Ruby-based application from [delayed-job](https://github.com/collectiveidea/delayed_job) to [sidekiq](https://github.com/sidekiq/sidekiq/). For those not familiar with Ruby, think of these as two libraries that help you run async jobs in a distributed system, similar to [JobRunr](https://www.jobrunr.io/en/) in Java projects or [Celery](https://docs.celeryq.dev/en/stable/) in Python projects. We encountered several issues with the old library and realized that Sidekiq would be a much better option as we scaled. To summarize:

1. Sidekiq runs multiple threads per process to execute jobs, while Delayed Job runs one thread per process. This means Delayed Job uses more memory for executing the same set of jobs per unit time, especially if your workloads are IO-bound.

2. Delayed Job uses SQL table to store jobs, whereas Sidekiq uses Redis. Redis, being an in-memory database, is much faster than traditional disk-based SQL databases.

3. Sidekiq is a very popular Ruby library, so there are many extensions available for performing other common tasks. These include [running crons](https://github.com/sidekiq-cron/sidekiq-cron) and ensuring [unique jobs](https://github.com/mhenrixon/sidekiq-unique-jobs). Additionally, Sidekiq’s author has [started supporting](https://github.com/sidekiq/sidekiq/wiki/Using-Dragonfly) a drop-in [replacement for Redis](https://www.mikeperham.com/2024/02/01/supporting-dragonfly/) for storing jobs.

4. While many open-source extensions exist for Sidekiq, companies can get more features and premium support with [Sidekiq Pro](https://sidekiq.org/products/pro.html).Migration phase


We added both libraries together for a few months and gradually migrated from DJ to Sidekiq. The two most common uses of background jobs were:

1. Calling an instance method asynchronously, like loading a model entry from the database and calling a method on it asynchronously (e.g., `Model.find(some_id).process_it_async`).

2. Calling a class method asynchronously, which might initialize more classes or call methods as needed (e.g., `SomeClass.process_class_method_async(some_data`).)


At that time, I was a typical **startup engineer** with limited knowledge of code quality, focused primarily on **getting things done.** Consequently, I wrote a small class that facilitated the migration of many usages to Sidekiq:

```ruby
class GenericAsyncWorker
  include Sidekiq::Worker

  def perform(klass, method, args)
    if args[:id]
      klass.constantize.find(args[:id]).send(method)
    else
      klass.constantize.send(method, args)
    end
  end
end
```

This is not the exact code but gives an idea of what I wrote. In short:

1. If `args` had an `id`, I loaded the model object and called `method` on it.

2. If not, I called the `class method` with the given `args`.


For non-Ruby developers:

1. `include Sidekiq::Worker` makes this class a background job processor.

2. `find` loads a table row from the database based on ID. It’s part of Rails’ ORM.

3. `send` dynamically calls methods of a class.


There was a very kind Senior Engineer who reviewed my code later and said, "*this is not good, this is too generic*." I didn't understand what they meant at the time. My thought process was — *it's working and it helped complete the migration faster, so what's the problem?*

Before you read on, take a moment to think about whether this is good or bad.

## The Problems

Even though the code above works, it breaks key principles of good, maintainable code:

1. According to the **S** in **SOLID** principles, a class should have one reason to change. I also apply this to methods — a method should do one thing really well. This method is trying to do two things. You might think the method is small and only doing two things, so what's the issue? Read on to understand.

2. The code inside the `if` statement expects to load the model object and then call `method` on it. What if someone wants to pass arguments to that `method` also? Would we add another argument or `if` statement to handle that?

3. What if this class is a plain Ruby class (not a Rails model) that needs to initialize the constructor and then call the `method`? Another flag to handle that?

4. As you might know, we assign **queues** to process **specific jobs**. Queues are chosen based on the urgency of the task. If many tasks start running with this generic code, how do we determine the urgency of this job class?


By just looking at the code for a minute, I quickly spotted these problems. I laugh now, thinking I wrote this back in 2019. But that's a good sign because if you don't like your old code, it means your design skills are matured 😇.

The above is an example of **Generic Code.** Such classes evolve into [long methods](https://refactoring.guru/smells/long-method) with a [lot of arguments](https://refactoring.guru/smells/long-parameter-list), creating a mess. Over time, multiple developers change the code in these classes to fit new use-cases, often breaking existing ones. There are only two ways to solve such problems:

1. Don’t create such classes in the first place.

2. If you created them somehow, gradually move to specific classes and delete the old one later.


I don't suggest spending time untangling the mess built up over the years by different developers unless you have test cases and very strong reasons to do so. It's better to create specific classes for each use case and migrate to them slowly.

### Let’s talk about testing

**Note**: Many developers and teams don't write unit tests. If you're one of them, I strongly recommend you start. They make future maintenance easier and provide feedback on your design.

If you write tests regularly, you'll see that this class is hard to test. The reason is simple - it has a lot of generic behavior, making it difficult to identify all the combinations you need to test. From my mast experience, **if a class is hard to test, it likely needs refactoring**.

I still see developers writing generic code for production projects. This isn't necessarily a problem, as they are on the same learning journey I once experienced. When I encounter this, I take the time to discuss it with them. I emphasize the importance of writing specific, maintainable code. I share my experiences and lessons learned over the years.

### Extending the same throught process to “tables”

Developers love writing code that goes beyond their current needs. As we saw earlier, they often create solutions that are more complex than necessary. But this issue isn't just limited to classes — we also tend to generalize tables and columns to handle more problems than they were meant to solve.

Let's imagine a developer named "John" created a table called `users` to handle authentication for their app. At first, this table had only six columns:


```
                                 Table "public.users"

Column         |            Type             | Nullable  |         Default
---------------+-----------------------------+-----------+----------+-----------------------
 id            | integer                     | not null  | nextval('users_id_seq'::regclass)
 first_name    | character varying           |           |
 last_name     | character varying           |           |
 email         | character varying           | not null  |
 created_at    | timestamp without time zone | not null  |
 updated_at    | timestamp without time zone | not null  |
```

As time went by, they realized they needed more columns like `middle_name`, `country_code`, `language`, and `timezone`. So, they added those columns as needed (sounds good, right?). As their product expanded to multiple countries, they needed to track specific attributes for each country. They decided to add a `jsonb` column to the `users` table to handle these “country-specific” attributes because some keys were valid in one country but not in another. Adding separate columns for each attribute seemed like overkill. Thinking ahead, they named this field `extra_attributes`.

A month later, another developer, Lee, decided to add their data to the `extra_attributes` column since it was a similar use case (but not dependent on country). Within a year, this column had different values for different users, and no one knew all the use cases for this column. This is why I sometimes don’t like NoSQL schemas — they are too flexible unless you have proper safeguards. To avoid this:

1. John could have named this column something other than `extra_attributes` to indicate it was for storing country-specific attributes only (better naming).

2. John could have created different tables with a 1:1 relation to users for such use cases. Anyone could check the `country_code` column and figure out which table(s) are relevant for a specific country’s user (better design).


Whenever we introduce a bit of **generic behavior** in our code or database design, it is likely to be misused later. This happens because everyone thinks differently and wants to deliver quickly 🚀.

This is just the first level of misuse. Another common **generic mistake** is creating tables like **tags** or **attachments**. Once these tables exist, everyone adds their own use cases, making them very large. I've seen cases where more than 50% of data is in a generic table, just to avoid adding a column to the primary table. While querying the primary table is easy, querying this table requires a large index, which can be even bigger than the table itself. The problems with large generic table are:

1. You can’t archive old data even if the index and table size keep growing. So you end up paying the cost of keeping all this data in hot storage (eg. SSDs).

2. You can’t partition the table easily.

3. Queries become slower over time.

4. Internal tasks like [Vacuuming](https://www.postgresql.org/docs/current/sql-vacuum.html) take longer.

5. When you upgrade your database, these tables take more time to analyze and start serving data.


And all these problems exist because there are too many use cases being served, and you have no idea how your solution could affect the users. Just like with generic classes, the solution is to eliminate this table and gradually migrate the data to specific columns (or perhaps specific tables).

## Conclusion

While generic code and database design can offer flexibility and quick solutions in the short term, they often lead to significant long-term challenges. Over-reliance on generic patterns makes testing difficult, as it’s hard to test all the supported cases. Similarly, abusing generic database structures can result in performance bottlenecks, scalability issues, and maintainability problems. The key takeaway is to strike a balance between flexibility and specificity. While some level of generalization is beneficial for code reuse and rapid development, it is essential to maintain a clear structure, define boundaries, and optimize for performance and future growth to avoid technical debt.

Thank you for reading! Have a good day.

---

If you liked this post, please read these too:

1. [Multitasking is not that cool](https://blog.gagan93.me/multi-tasking-is-not-so-cool).

2. Are you planning to transition from monolith to microservices? Read [this](https://blog.gagan93.me/monolith-microservices) once.

3. If you’re planning data migration from one system to another, read [this](https://blog.gagan93.me/migrating-data-across-services).
