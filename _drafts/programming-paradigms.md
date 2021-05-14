---
layout: post
title: "Clean Architecture by Robert Martin: Programming Paradigms"
---
In [Episode 64][episode-64] of the video lesson series, Uncle Bob introduces us to three foundational programming paradigms: structured, object-oriented, and functional programming. That episode maps to Part II of [Clean Architecture][ca-book] book. 

## What is a programming paradigm? 

A concept of "programming paradigm" is quite vague, and it seems to be dependent on what aspects the user of this term wants to emphasize. For example, one can talk about "imperative vs declarative", or "procedural vs object-oriented" paradigms, or "parallel vs sequential" paradigm, or whatever else. All in all, the introduction of "programming paradigms" seems to attempt to classify programming practices by their features, and it depends a lot on what subset of features we want to focus on, and which ones to exclude. 

I think Uncle Bob takes a similar path. Since his focus is on software architecture, he looks at programming paradigms as *disciplines* we impose on the way we create programs. Having binary machine code at one extreme, as "wild West" of programming freedom, where a programmer can do whatever she wants, he argues that programming paradigms don't *add* capabilities. Rather, they *remove* capabilities from a programmer by imposing strict rules on what *can't* be done. 

I suspect also, that he chooses the paradigms to focus on that lay down a foundation for future chapters, therefore he only chooses 3 paradigms that he thinks are most significant for software architects: structured, object-oriented, and functional programming. 

> Paradigms are ways of programming, relatively unrelated to languages. A paradigm tells you which programming structures to use, and when to use them. 

Overall, the entire episode is summarized in [the following sentence][episode-64]:

> Well architected software systems are composed of recursive applications of sequence, selection, and iteration, hung on a framework of inverted dependencies and plumbed through and through with flows of immutable data. 


## Structured Programming

> Structured programming imposes discipline on direct transfer of control. 

## Object-Oriented Programming 

> Object-oriented programming imposes discipline on indirect transfer of control. 

### Dependency Inversion

## Functional Programming 

> Functional programming imposes discipline upon assignment. 

### Event Sourcing

[episode-64]: https://cleancoders.com/episode/clean-code-episode-64
[ca-book]: https://www.goodreads.com/book/show/18043011-clean-architecture
