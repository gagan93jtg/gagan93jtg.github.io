---
layout: post
title: "Debugging Production downtimes"
date: 2023-10-29
published_on: 29th October, 2023
author: Gagandeep Singh
image: "/assets/images/2023-10-29-debugging-production-downtimes.jpg"
categories: production outage debugging
excerpt: Downtime refers to a period when a system/service is partially or completely unavailable. Based on the criticality of service and the customers you're serving, this can cause a loss of millions of dollars. I've been on the...
---

Photo by <a href="https://unsplash.com/@greatmalinco?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Daniel Tausis</a> on <a href="https://unsplash.com/photos/fireman-watering-fire-loeqHoa1uWY?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
---
{: style="text-align: center;font-size: 0.8em"}


*Downtime* refers to a period when a system/service is partially or completely unavailable. Based on the criticality of service and the customers you're serving, this can cause a loss of millions of dollars. I've been on the frontline for debugging and fixing such downtimes for many years. Although most of my experience covers startup tech and you might have a different setup, I still believe that the general way of solving things remains the same.

Before going into details of how we can solve (or assist in solving) a downtime, let's see a few reasons that cause downtimes:

1. **DOS/DDOS attacks** - An unexpectedly large number of requests can cause systems to become slow and eventually go down.

2. **Network glitches** - Changes done to security groups, route tables or other similar network layers can cause a system to be unavailable for use.

3. **Downtime due to deployment** - This happens when some heavily used system (or an API endpoint) gets slow due to some recent changes that introduced slowness. Because this is heavily used, this can occupy all the available bandwidth of the app server and take it down.

4. **Cascading failures** - If there is a system on which your service highly depends, and that becomes too slow or goes down, then there are high chances that it will take your system down as well. We can debate on "missing timeouts" and "coupling" in this setup, but for now, let's agree that this can cause downtime.

5. **Cross A/Z deployments/changes** - Sometimes, we mistakenly introduce latency by choosing a different availability zone for some latency-critical systems. The impact of such changes is noticed only when the usage scales.


---

When you see an application outage, two things to do are:

1. Fix it asap.

2. Retrospect and improve.

Let's look into these one by one

## Understanding and fixing the issue

If you don't have a very good monitoring setup, you'll get a text like this from your friend in the product or business team:

> Hey, the customer reported 503 error on the website, can you check?

Congratulations 🥳. Your journey starts now. Let's try to navigate it together.

1. **Check alerts** 🔴 - If you have some red signs already through email, chat or some other medium, you might get some idea of what's wrong. I remember in my previous project we had a cluster of Redis servers (one master, multiple replicas) and There was an alert configured for replication lag of more than 10 seconds. Whenever someone ran a `KEYS *something*` command on it, we use to get plenty of alerts instantaneously. (You might be blaming the developer for not knowing that `KEYS` command is [blocking and runs in O(n)](https://redis.io/commands/keys/), but the issue was that usage of that redis was not documented at all and most of us maintaining the project were junior engineers).

2. **Get the right people** 🧑‍🤝‍🧑 - So there are two outcomes of step 1:

    1. You know what's wrong and which team owns this - Get those people on call.

    2. Or you're not sure what is down, or if the app is a monolith - There should be some people in the team who generally debug such things. Like old engineers of the team (god bless you if you're the one). Get them on the call.

        You might want to add some experts like DevOps (if you have a dedicated team), or database experts (if the database looks like a bottleneck) from your team. Although I agree that it might be hard to get people on call at odd hours.

3. **Someone has to lead** 🤵 - Probably you were the first person to notice the downtime, and someone else knows the system better than you. Let them lead if that's the case. Although fixing this situation would need collaboration from everyone, there has to be a person who's doing primary debugging, sharing their screen, and delegating some tasks to someone else.

4. **Know your tools** 🛠️ - I've debugged downtimes in those situations also where we had very minimal tooling setup, but it's good if you have at least:

    1. A centralized logging solution (eliminates the time required to SSH to all servers to check logs).

    2. An APM tool with distributed tracing (reduces the time to understand the root cause in many cases).

    3. Basic Pod/VM monitoring (helps to understand if RAM/CPU/Network/IO is the bottleneck).

        Having these tools is important, but knowing how to use them is even more important. If you're not familiar with your tools, please learn them. Downtime is not a good time to learn about them. If you don't have such tools, you should be hands-on with some unix commands. For eg. I'd use a combination of `tail`, `grep` and `awk` commands to debug access logs if I don't have a logging solution available. Similarly, there are commands to see running processes (`ps aux`), free memory (`free -h`) and disk usage (`df -h` ) but these won't show you historical data which is useful for debugging.

5. **Thinking from First Principles** 🤔 - Although I talk about some common issues later, anything beyond these four points would be different for different projects/architectures. Here, we need to start thinking from the very basic things we know. The following statements should help to build some understanding:

    1. If the database is causing issues being a bottleneck, one/more of these might be true:

        1. Is there some cron job or custom script running that can cause this?

        2. Has some table table recently exploded in size that was being used

        3. Are we creating an index that might have locked the entire table?

        4. Is this (locked) table heavily used?

            To answer any such question, we'd want to see the running queries. I've [bookmarked this](https://gist.github.com/rgreenjr/3637525) years ago to debug running queries on Postgres.

    2. If some specific endpoint is running slow:

        1. Is there a specific query that is running slow here?

        2. Can we quickly see what we need to fix? (Maybe add an index).

        3. Is there any downstream service that is slow/down, causing the slowness? Can we [short-circuit](https://microservices.io/patterns/reliability/circuit-breaker.html) the broken downstream for a while?

        4. If the reasons are complex, can we isolate the endpoint to some specific servers/pods only? This should be configurable at the Ingress/API gateway or Load balancer based on your setup.

    3. If a recent deployment caused slowness:

        1. Can we revert to the last stable release? (your releases should be backwards compatible to do this)

    4. If a recent infra change caused this:

        1. If you're using [IaC](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac), can we revert to the last stable setup? Infra changes can cause network disruptions (eg. modifying a security group rule) and reverting the same should generally help.

    5. If the app servers are slow due to some surge of requests:

        1. Can we restart the app server processes to clear the queue? (this might lead to a loss of requests unless done gracefully)

        2. Should we set up some rate limiting here?


        The above list can go long according to your architecture and common issues faced but we'll stop here. The idea is that once you scope the problem to a specific section, assume minimal correctness in the system and validate everything one by one.


Debugging downtimes is a hard problem, but solving one gives much more satisfaction than any feature release 😁 (at least to me). The learning that we get only by being present in such discussions/calls is very different (and deep) as compared to regular work. As a junior engineer, you get to see how your production is set up and what are the moving parts. If you're a senior engineer, you see how your service interacts (and depends) on other components of the system. System outages frequently highlight areas that are vulnerable and require improvement. There are even more complicated reasons (like automation) that can cause hours of downtime (like [Github's 2018 outage](https://www.youtube.com/watch?v=dsHyUgGMht0&t=646s)).

I'm sure you must also have your two cents to add here. Please share your experiences in comments.
