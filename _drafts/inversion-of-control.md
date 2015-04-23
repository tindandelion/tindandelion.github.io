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

# What's the problem?

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

The approach described above is fine for writing batch-style applications, where
the flow of control was totally determined by the application's
developer. However, it falls short when we start developing modern UI-based (or
Web-based, for backend geeks) applications. In applications of this kind, the
main routine is almost identical for every application. In essense, it's just an
event loop that receives events from an operating system and dispatches them to
application-specific event handlers.

To address the problem of writing a reusable library for such kinds of
applications, we'll need to take `main` routine along with the high-level
orchestration from the developer provided code, and put it into a reusable
library:

(picture)

Notice the remarkable change that happens here. Earlier we had
application-specific code that called third-party libararies, now we have most calls
going in the opposite direction: from a third-party library to the
application-specific code. This approach was fresh and new, enabled by the
concept of *polymorpism* and popularized by object-oriented languages. And so
it's got a name **Inversion of Control**, as opposed to 'traditional' direct
control flow.

# Frameworks

Armed with this principle, we can develop a library that would contain the
high-level logic of application orchestration; this library can be reused across
all applications of a similar type. Application-specific behaviour can be
provided by *extending* the basic control flow. In other words, the application
developers now provide their code in form of *plugins*.

Such architecture are very popular nowadays, and libraries that dictate the
high-level application behaviour got their own family name: **frameworks**. 

# Hollywood Principle

Queue, 2 examples: polling and listener registration



# Relation to Dependency Injection





