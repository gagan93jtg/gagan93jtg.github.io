---
layout: post
title: "Fixing code exceptions"
date: 2023-07-01
published_on: "1st July, 2023"
author: Gagandeep Singh
cover: "/blog/assets/images/2023-07-01-fixing-code-exceptions.jpg"
categories: bug-fixing data-issues stability
excerpt: A regular day in the life of software engineer includes a lot of work - discussing status of things, writing new code, fixing customer issues, mentoring others and so on. Specifically, if we talk about fixing customer issues, they could be of two kinds
---

![cover-photo](/blog/assets/images/2023-07-01-fixing-code-exceptions.jpg)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"
}

Photo by <a href="https://unsplash.com/@mrthetrain?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Joshua Hoehne</a> on <a href="https://unsplash.com/photos/LndcUO8Z-IM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}

A regular day in the life of a software engineer includes a lot of work - discussing status of things, writing new code, fixing customer issues, mentoring others and so on. Specifically, if we talk about fixing customer issues, they could be of two kinds:
1. A feature was built wrong but is not throwing a code level exception.
2. A corner case exists in the feature causing an exception in the code flow.

Today, we'll discuss about the second case i.e. exception scenarios. Software teams integrate tools in their code repositories to capture such exceptions. These tools can be self hosted or commercially hosted by some company. Sentry and Bugsnag are the most common tools I've heard in this space. I've also used tools like [exception notification](https://www.rubydoc.info/gems/exception_notification/4.1.4) for my personal projects. At LocoNav, we've been using Bugsnag for more than 5 years now. We have also integrated Bugsnag with our JIRA. So all the exceptions get tracked as JIRA tickets.

Interestingly, I often see developers "just trying to fix the bug" in order to close a bugsnag issue. So I'm trying to pen down what we should be focussed on when we see an exception assigned to us:

1. **It's both good and bad** - Softwares become complex, and we miss out testing specific cases, so exceptions can occur. It is not a sin. But the severity of that issue depends on what is broken. You might be running a software for life-critical operations. So your bug can cause a greater damage. Or a stock market trading website, so a bug makes you or your customer loose real money. For large organisations, bugs and downtimes cause loss of millions of dollars. So in brief, it's might be fine to cause such issues once in a while, and in very corner cases. But not OK to normalize it. Developers often put blames on QAs for missing the specific test case. But I personally believe that your code is your responsibility. No CR mistake, no QA mistake. Test it well using both automation and manual flows before taking forward.

2. **Prioritize bug fixing** - It might become an attitude to have many open bugs in your module in the name of "bandwidth crunch". This simply means that you don't prioritize bugs. On one hand, developers talk about "users dropping from a website due to slow page load" ([reference to this context](https://kinsta.com/blog/ttfb/)) and on the other hand they normalize broken features. Crazy, no? Convince your leaders and product teams to prioritize these bugs as a part of every sprint.

3. **Don't just fix the issues** - Please understand the issues before doing a fix - find the user(s) who are facing this, reproduce the issue on production, then do the same on your local machine (if possible), do your investigation and discuss the fix with your team. Make sure you understand that the bug completely before doing any fix. Also check if it is only a missing null-check or some design issue. Simplest fix can do a greater damange (discussed more in point 5).

4. **Please fix bugs, not bugsnags** - I wrote this line in the past in our slack channel. I had to write this because I saw people raising pull requests to fix null pointer issues by [safe handling the null check](https://blog.shiftasia.com/better-null-check-with-safe-navigation-operator-in-ruby/). This is the worst thing you can do to fix the issue. It simply means that the feature might still not work perfectly, but atleast it will not throw an exception now 😑.

5. **Long term data issues** - Sometimes, having bugs in your code do a greater damage. They either hide data issues, or cause data issues. I'll give examples of both below (code samples in Ruby):

```ruby
# code hiding a data issue

classs MyService
  def perform(user_id)
    user = User.find_by(user_id)
    if user
      user.do_this
      user.do_that
      user.send_some_email
    end
  end
end
```

Now this code will never report any issue if an invalid `user_id` is passed to it. If this sounds like a feature to you, then you might be mistaken (read this [philosophy](https://en.wikipedia.org/wiki/Fail-fast)). Do you get an error if you try to insert some data into a table with wrong column names? Or does SQL simply ignore the wrong column and insert rest of the data? While your code should work as expected for expected cases, you should also make sure that it raises the required alarms in case it is not given the correct input. Here, the `if` statement is hiding an error inside it. So in case a user_id stored as a foreign key in some other table is passed to this service, and incase that user is missing from the database, nothing would report it. Probably some developer added this if statement just to fix the issue (point 3). But this is what damage it can cause.

Coming to the second case:

```ruby
# code causing a data issue

class MyService
  def track_activity(user)
    Activity.create!(start_time: <>, end_time: <>, user_id: user&.id)
  end
end
```

Looks like some developer added safe navigation to avoid an exception. The implication of that fix is a data issue that you can probably never solve. Clearly, a null user can be passed to this service and nothing will break. And that's not a feature but a very huge bug. You can have activities in your database that contain null in `user_id` column, and there are chances that you can never associate that to a genuine user. So you'll be left with customer issues telling that some activities are not tracked, and some entries with null `user_id`.

---
\
Fortunately, I've been part of both the words - the teams where we started from scratch and did very fast development, and the teams where the software was built by someone else and we did only maintenance / bug fixing. And after seeing issues in both the worlds, I can infer that bug fixing is a serious matter, and it needs more attention than building something from scratch. Do understand the scope of the feature and bug before you raise a pull request for the fix.

Happy bug bashing 😁
