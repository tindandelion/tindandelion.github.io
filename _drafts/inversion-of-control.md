---
layout: post
title: Inversion of Control principle explained
---

I've had a 'water cooler chat' with my teammates recently, and occasionally one
of us asked to explain the concept of 'Inversion of Control'.  We all started to
give our own explanations but, to my surprise, nobody could give anything better
than hand-waving and a mumble 'The flow of control is inverted, and so...'. Oh,
and one thing everyone remembered was that
[Dependency Injection](http://en.wikipedia.org/wiki/Dependency_injection) is a
good illustration of the IoC, thanks to the
[great article](http://martinfowler.com/articles/injection.html) by Martin
Fowler on the subject.

I was no better than the others, having realized suddenly that I couldn't
soundly explain even why this principle was called so. Then I decided to spend
some time filling the blanks in my education. This post is my report based on
the study I've made.

# What's the difficulty?

The biggest problem with explaining the meaning of IoC is that nowadays it's used
everywhere and considered 'obvious' by many, because it lies in the foundation
of nearly every framework popular these days. In fact, it was this principle
that enabled the notion of a 'framework' itself.

The other fact that doesn't contribute to understaing is that usually the IoC
principle is described in conjunction with Dependency Injection pattern, which
narrows the idea too much to grasp the whole principle. Somehow we forget that
Dependency Injection is only one implementation of this quite general idea.

# A bit of archeology

Let's go back in the past and turn our attention to the
[article](http://www.laputan.org/drc/drc.html) that, according to Fowler,
introduces this principle:

> One important characteristic of a framework is that the methods defined by the
> user to tailor the framework will often be called from within the framework
> itself, rather than from the user's application code. The framework often plays
> the role of the main program in coordinating and sequencing application
> activity. This **inversion of control** gives frameworks the power to serve as
> extensible skeletons. The methods supplied by the user tailor the generic
> algorithms defined in the framework for a particular application.

At this point, if you are smarter than me, you should scream "Aha!". If so, just
skip the rest of this post. However, if you are like me and feel this is still
too obscure, let's move on and figure out what this all is about.

# Being direct

Back in the 80's, the most popular method was *structured design*. Structured
design is a top-down approach: you start with the `main` routine that defines
the high-level flow of your program. Then you define subroutines invoked by
`main`, then subsubroutines those subroutines call, and so forth, ending up with
the hierarchy shown in the picture.

In this structure, it is assumed that you, the pallication developer, is
responsible for writing the `main` routine and high-level procedures it
invokes. As for reusable libraries, they tend to stick to the lower levels of
abstractions: command line parsing, general data structures and algorithms,
input/output libraries, etc. Those libraries always play the passive 'helper'
roles. The central orchestration is always provided by the application
developer. The flow of control always go from top to bottom, from the
application-specific code to the lower-level generic reusable libraries. We'll
call this **the direct flow of control**. 

# Getting inverted

The structure described above is good for command-line tools and streamline user
interfaces. 

This structure is good for pipeline applications, where the high-level flow of
control is specific for every application. However, this structure does not
address the situations when the applications start to share the same high-level
flow, and differ only in the details.

Consider a typical example: the Web server. 


# Hollywood Principle

Queue, 2 examples: polling and listener registration

# Frameworks

# Relation to Dependency Injection





