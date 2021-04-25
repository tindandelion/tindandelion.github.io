---
layout: post
title: "Clean Architecture by Robert Martin: Introduction"
---

I read Robert Martin’s (aka Uncle Bob’s) latest book [Clean Architecture][ca-book] a couple years ago. I found the ideas in this book quite valuable, even eye-opening at times. Recently, Uncle Bob started a series of [video lessons][ca-videos] on the same subject. I decided to take this opportunity to revisit his book along with watching the videos. This post is my notes on [Episode 63: Architecture Begins][episode-63], which corresponds to Part 1 in the book. In this episode, Uncle Bob introduces us to what software architecture is and why it’s important. 

# Architecture is a method of cost reduction

> "The goal of software architecture is to minimize the human resources required to build and maintain the required system.
> &mdash; <cite>Robert Martin</cite> 

In the video lesson, he adds *deployment* as an activity as well: *"...build, **deploy**, and maintain..."*

As an illustration of a software process went wrong, Uncle Bob quotes Jason Gorman's talk [Slow & Dirty][slow-dirty]. In this talk, Jason describes a software company, whose product became more and more expensive to develop with each release. 

![Project costs rise](/images/clean-acrchitecture-intro/project-complexity.png)

# Architecture vs design

> Architecture represents the significant design decisions that shape a system, where significant is measured by cost of change.
> &mdash; <cite>Grady Booch</cite>

What’s the difference between software design and software architecture? There's none at all. In theory, one might argue that the difference is in scope: architecture deals with high-level context, but the design is more about low-level details and structure. In practice, however, they can’t be separated from each other. In practice architecture, design, and code form a continuous fabric that defines the shape of the system, and there’s no clear dividing line that separates them.

![Architecture Design Continuum](/images/clean-acrchitecture-intro/design-arch-continuum.png)

# The rules of architecture are independent of other factors

The rules of architecture are the same across different types of systems.  They are independent of the type of the system we are building, be it a real time embedded system, batch processing system, web service, etc. The resulting *architectures* may and will be different because of different requirements and constraints, but the *rules* of organizing the code to achieve the goals are the same. 

The reason why there’s no dividing line is that software is somewhat recursive by nature. At every level, it’s made of the same building blocks: sequence, selection, and iteration. They haven’t changed since the beginning of computers. The rules of architecture are the rules of ordering and assembling these building blocks.

![Code building blocks](/images/clean-acrchitecture-intro/operation-types.png)

# Architecture is an ongoing process

We need to take care of the system’s architecture since it’s very beginning. But how are we supposed to do that? By definition, the beginning of the project is the time when we know *the least*. The answer is: architecture is an ongoing process. As we develop the system, we discover new knowledge about the requirements, the limitations of infrastructure, time constraints, etc. And so we invent the ways to address those things, and incorporate the decisions into the overall architecture of the system. This process goes on throughout the entire lifetime of the system. 

> Architecture is a hypothesis, that needs to be proven by implementation and measurement.
> &mdash; Tom Glib

In a sense, at every moment the software architecture is a *hypothesis* about the future changes and how to address those changes. Like any other hypothesis, it needs to be tested against the reality, and adjusted (or even discarded)  if it turns out to be inadequate.

> Architecture is the decisions you wish you could get right early in a project, but that you are not necessarily more likely to get them right than any other.
> &mdash; Ralph Johnson

Good architecture supports future changes by maximizing the *specific decisions not made* at any given time. In other words, we can defer the decisions until we know more, and keep the options open while we go forward. There is a tension between structure (rigidity) and chaos (possibilities) that needs to be kept in balance. 

![Architecture is an ongoing process](/images/clean-acrchitecture-intro/design-cycle.png)

# Architecture is a value

Every system provides 2 different values to the stakeholder:

* Behaviour: what the system does that brings value to the stakeholders;
* Structure: how easy it is to change the system. The cost of the change should only be dependent on the *scope* of the change, visible to stakeholder, not the *shape* of the change, which is usually not observable from the outside.

Which one is more important? Well, they both are, but on a broader timescale we could argue that the architecture is more important than the current behaviour. Placing those values to the famous *Eisenhower’s matrix of importance versus urgency*:

![Eisenhower's Matrix of Importance/Urgency](/images/clean-acrchitecture-intro/architecture-quadrants.png)

Behaviour is usually urgent, but not always important. Architecture is important, but not particularly urgent.

The challenge here is that the importance of architecture is not obvious for the business managers. The mistake is that business tends to elevate *all* behavior to be urgent and important. The development team, as *one of the stakeholders*, is responsible for delivering good architecture. To keep urgency/importance balance in check, there need to be a healthy conflict between the business managers that struggle for features, and the development team that struggles for architecture. 


[ca-book]: https://www.goodreads.com/book/show/18043011-clean-architecture
[ca-videos]: https://cleancoders.com/series/clean-code
[episode-63]: https://cleancoders.com/episode/clean-code-episode-63
[slow-dirty]: http://www.codemanship.co.uk/files/slow_and_dirty_with_callouts.pdf
