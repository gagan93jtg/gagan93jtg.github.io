---
layout: post
title: "Atlassian Interview Experience"
date: 2024-05-04
published_on: 4th May, 2024
author: Gagandeep Singh
cover: "/blog/assets/images/2024-05-04-atlassian-interview-experience.png"
categories: atlassian interview senior-software-engineer
excerpt: I interviewed for the position of Senior Software Engineer at Atlassian in November 2023. This was my first ever experience getting interviewed by a large product organisation. Just to brief ...
---

![cover-photo](/blog/assets/images/2024-05-04-atlassian-interview-experience.png)
---
{: style="box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 3px;"}

Photo by <a href="https://logos-world.net/wp-content/uploads/2023/03/Atlassian-Logo.png">Logo World</a>
{: style="text-align: center;font-size: 0.8em"}


## Background

I interviewed for the position of **Senior Software Engineer** at **Atlassian** in **November 2023**. This was my first ever experience getting interviewed by a large product organisation. Just to brief about myself and my background - I currently work as a Staff Software Engineer at LocoNav India (2018-present) and have previously worked with Josh Technology Group (2015-2018). You can know more about me [here](https://gagan93.me/). I was not actively looking for a change but thought of giving a try. Having spent ~ 6 years at LocoNav (as of that time), I was completely out of touch with the current market expectations and interview process. Atlassian, just like many other big tech companies takes candidate experience very seriously. So their HR contacted me and explained everything on a 30 minute phone call including my salary expectations. They did not ask my current compensation though (something most of the companies ask). After our call, he sent me a few emails that summarized whatever he explained and had details about the interview process. Apart from this, the email also contained some documents to assist me in preparing (eg. telling what all things I should go through). Overall, it was a very good experience with them.

## The rounds

Atlassian was hiring aggressively in past 6-8 months for multiple positions (Senior/Principal/Fullstack) and rounds are more or less same for these positions, except 1-2 extra rounds for Principal Engineers. The rounds were as follows:

1. [Karat](https://karat.com/) screening round (coding + Rapid QnA)

2. Data structures round (coding)

3. Low Level Design round (coding)

4. System Design round (diagrammatic mostly)

5. Values round (discussion)

6. Management round (discussion)


The same is documented [here](https://online.flippingbook.com/view/325478/4/) as a reference for candidates.

## Round details

**Karat Screening Round**

Karat is an online platform used by companies like Atlassian, to filter candidates after shortlisting the resume. The interviewers are Senior Engineers who are trained for many hours before they start taking interviews. As they have a global pool of interviewers, you can choose any time slot (unlike for other rounds) and they'll arrange an interviewer for you. My interviewer was an Indian from Hyderabad or Bangalore (don't remember exact location). He was very professional and friendly. Because this interview had to cover a lot of things in an hour, he made sure that we do not waste time discussing something specific at length. I remember him introducing himself within 15-20 seconds and then asking me to introduce myself in a minute or less. The format of the round was as follows:

1. Introduction and explanation of format - 3-4 mins

2. 5 Rapid fire system design problems (debugging rather than diagramming) - 20 minutes

3. Two data structure problems (easy, medium) - 30 mins


Because this round was not with a company employee, you do not ask questions about the company in this round. We started with rapid fire system design problems. Here, we do not solve one large problem (like designing Spotify or Google Drive). Rather, we are presented with situations where experience is required to debug a system that is facing problems. I found this much better than the actual System Design round that all the companies take because only practical knowledge can help in debugging such problems. There were five questions, out of which I answered 4 correctly (the passing percentage was 60%, i.e. 3 questions). Just to share a few of them:

1. A system is running very slow (+ some more details about the system). How would you debug this to solve the slowness.

2. A system is scaling from x to y users (x and y are number of users. What things would you consider to upgrade in your system to ensure smooth scaling?

3. An electronic system exists for a smart freezer. An external computer system does a processing right now but later we’re assuming to migrate this code to an internal microcontroller (raspberry pi for example). What things to consider while porting this code?


These questions were easy for me because I had seen systems growing during my role at LocoNav. So I knew the pain points. In this round, the challenge lies in quickly understanding the problem and sharing all potential solutions within 3-4 minutes. With 5 questions to address in just 20 minutes, this means you have approximately 4 minutes per question, including the time taken by them to read out each question. To optimise your chances of success, the Atlassian Talent team recommends requesting the interviewer to refrain from reading the questions aloud, allowing you to read them at your own pace and save valuable time.

After this, we moved to the data structure problems where the first question was around string manipulation. They use [Coderbyte](https://coderbyte.com/) platform to asses the coding part. I chose Ruby language to solve data structures in all the coding rounds I have given because I was most comfortable in Ruby. Unlike Leetcode, the test cases are not large in number and you're just expected to pass 5-7 test cases. I don't remember the exact problem but I remember that it was an easy one and related to Strings. One thing I remember is that I told wrong complexity when I was asked for the first time, and within 2-3 seconds I figured out and corrected myself. The second question sounded medium level leetcode problem but there was not much time left so I just explained the logic that sounded okayish to him and we concluded.

I had a chat with my recruiter who told me that I should have qualified as solving one DS problem was the criteria and I had also explained the logic for second one. One bad part here was that he ghosted me for about 2 weeks after this round (didn't pick my calls or responded to chat).

**Data Structures Round**

After 2 weeks, I got a call from another recruiter within Atlassian who told me that she'll be taking my candidature forward. She explained that the next two rounds (Data structures and Low level design) would happen on the same day, with a difference of 30-60 minutes in between. Both the rounds were for about 45 minutes (although marked for 1h on Calendar). The data structures round was taken by a Senior Software Engineer who was working with Atlassian Bangalore team for about 2 years. Like the previous round, this guy was also very professional and polite. He explained the problem and started discussing the solution with me. The problem was similar to what is explained [here](https://leetcode.com/discuss/interview-experience/1739628/atlassian-sse-remote-reject) (don't go into his solution, just read the problem). There were multiple issues at my end due to which I didn't move forward from this round:

1. The question wasn't a hard one but I was much less prepared.

2. While most of the data structure problems are simple to implement with a single method (or maybe 2-3 methods for readability), this problem required classes to solve because he was changed the question twice after initial problem statement and that was only solvable cleanly if we had written a custom comparator in the class (basically tie breaking logic in the comparator).

3. It seemed like the round mixed DS and OOPs (low level) slightly but that's fine. He gave me hints after which I changed my approach, but probably that was a negative point that lead to rejection despite solving it. My implementation:


```ruby
class Ballot
  attr_accessor :candidates

  def initialize(array)
    self.candidates = []
    array.each_with_index do |candidate, i|
      candidates << BallotUnit.new(candidate, 3 - i)
    end
  end
end

class BallotUnit
  attr_accessor :candidate_name, :weightage

  def initialize(candidate_name, weightage)
    self.candidate_name = candidate_name
    self.weightage = weightage
  end
end

class Candidate
  include Comparable

  attr_accessor :weightages, :name

  def initialize(name)
    self.name = name
    self.weightages = []
  end

  # override the comparator
  def <=>(second_object)
    -(weightages.sum <=> second_object.weightages.sum)
  end

end

class Runner
  def get_results(ballots)
    candidates_map = Hash.new

    ballots.each do |ballot|
      ballot.candidates.each do |candidate|
        if candidates_map[candidate.candidate_name]
          candidate_object = candidates_map[candidate.candidate_name]
        else
          candidates_map[candidate.candidate_name] = Candidate.new(candidate.candidate_name)
          candidate_object = candidates_map[candidate.candidate_name]
        end

        candidate_object.weightages << candidate.weightage
      end
    end

    candidates_map.sort_by {|k, v| v }
  end
end

ballots = [
  Ballot.new(["A", "B", "C"]),
  Ballot.new(["A", "C", "D"]),
  Ballot.new(["B", "D", "C"]),
]
r = Runner.new
puts r.get_results(ballots)
```

**Low Level Design Round**

In this round, I was asked to write complete logic for the [snake game](https://www.google.com/search?sca_esv=58ac0b011cee9c7d&sca_upv=1&sxsrf=ADLYWILxVaKlInE0xUo1vWu1XUaU7ZPEjw:1714822721076&q=nokia+snake+game&uds=ADvngMjdw7-lOP0usjsMlKT3CLljzP00Ul4oFLKOAj9fGL-X8YrXHqfKk07DE1nxWsVjTChlHiOSf6mINDYeCaoPC80kWZL5frydgbHBTjR1-hBeX8_9mae0Jo4tFKDauOj2WZof5WWOTBGjTgfTRsJxhNX76UcXMq2fdnNIDy4XpwoCyddzgAaVdeFZqk8KxQNmT1nBUEup6WozpKo7AidCFu94Pjsc6hAHYEeOUzUUIxciXWD8hb2cykGoSwB7t1TBJoK9aab2T6YSSaZaRtKMkRFsxgudAzOnpozTwyj0JRoV9gxKM_zQwzRvBpfneq80yfWSeQP4&udm=2&prmd=isvnmbtz&sa=X&ved=2ahUKEwjkt5G59POFAxWtd2wGHZxpAXEQtKgLegQIEBAB&biw=1496&bih=812&dpr=2#vhid=vrfGi0KpOSUCsM&vssid=mosaic). The panel comprised of a Senior Software Engineer and a Software Engineer (as a shadower) from the Sydney team. Both were old members of the team. I was somewhat surprised to hear this question because I had read that this was asked by them in 2022 and I thought they won't repeat it. The miss on my side is that I didn't practice this at all, so it took some time to understand the requirement and start. The expectation was that I'll write a completely working code and write test cases (or at least discuss the edge cases) within 45 minutes. I later implemented the code in both [Ruby](https://github.com/gagan93jtg/lld-learning/tree/main/ruby/snakegame) and [Java](https://github.com/gagan93jtg/lld-learning/tree/main/java/snakegame) along with test cases and found that it was quite hard to complete this within the expected time frame. You can read the requirements (Readme in both the links) and the code as well. Do read test cases to understand what scenarios I've covered.

## Result

I was skeptical of my performance in these DS and LLD rounds and was quite sure that I won't easily pass these. Given the market conditions of Dec 2023 (and even today) where the supply of good engineers is much more than the demand, I was sure that either they'd reject me or will do the same round again. I called the recruiter after a few days who told me that they're not carrying my candidate forward. She was very transparent to read out feedback of both the interviewers on the call. I noted those points to improve upon them before giving further interviews.

## The Good and bad

The interviews these days do not test if someone can solve a genuine problem within an hour. They basically test if you can solve fast enough, and that is only possible by practising for days and months. I started my first job in 2015, and since then I had not formally prepared for any interview. The recruitment process at LocoNav was not very formal as I joined among the first 5-6 engineers. And having spent 6+ years at LocoNav, I was completely out of touch with the market expectations. Sharing a few good parts and mistakes that I did starting with good parts:

1. The interviewer saw my profile on Instahyre and reached out to me. As I knew that I'm completely unprepared, I took 2 weeks of time for preparation even before the Karat round.

2. I went through all the docs shared by him religiously and asked more questions to understand each round better.

3. After years, I started practising data structure problems and solved about 30-40 problems before my first round (mostly easy, medium).

4. My practical experience at LocoNav eased the preparation for LLD and HLD rounds (although I didn't attain the required speed because that needs more practice).


Now coming to some bad parts:

1. I didn't spend time in checking existing questions asked by them. Later I googled more and found that Atlassian is one of the companies that is known to repeat questions many times. One should always spend time in checking previously asked questions.

2. I should have taken about a month to prepare because I my practice was not enough. I was shy to ask for more time.


## Conclusion

*Was I discouraged by the rejection*? Yes (for a few days). But I applied in more companies and faced more rejections that helped in building my confidence. You might feel like you have practised enough, but that 1 hour of time with the interviewer is very different. The mental pressure leads to drop in confidence due to which you go in wrong direction and end up wasting time. The only way to solve this is to give more interviews and learn to be comfortable.

Atlassian was not my dream company but I have been using JIRA and confluence for years and I admire their products. I'm a JIRA administrator at LocoNav and my exposure has been far beyond the typical developer's usage. The good point about Atlassian was a remote role with handsome compensation. It is known to offer perks similar to FAANG companies (check their Bangalore office). But the bad part (heard recently) is that they revoked PPO for freshers and [have also been putting many engineers on PIP recently](https://www.teamblind.com/search/Atlassian). Looks like they've over-hired like many other companies :) Another thing that seemed off to me was that I got in touch with multiple people working at Atlassian (including the Data structures round interviewer) and all of them were working on the same thing - **Cloud migration**.

Atlassian still remains a dream organisation for many (thanks to didis and bhaiyas who keep uploading office tour videos). I'll be sharing more interview experiences in next few weeks. Thanks for reading and good luck if you're looking for a change.
