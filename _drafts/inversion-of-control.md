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

# What's in a name?

The biggest problem of explaining the meaning of IoC is that nowadays it's used
everywhere and considered 'obvious' by many, because it lies in the foundation
of nearly every framework popular these days. In fact, it was this principle
that enabled the notion of a 'framework' itself. 

Back in the 80's, the most popular style of application design was *structured
design*. Structured design is a top-down approach: you start with the `main`
routine that defines the high-level flow of your program. Then you define
subroutines invoked by `main`, then subsubroutines those subroutines call, and
so forth, ending up with the hierarchy shown in the picture.

Let's consider the typical flow of control in a program structured this way. All
actions are initiated by `main`. In a sense, the main routine *is* the
application: it determines what exactly the program does, so in general `main`
is the most application-specific part. When we talk about reusable libraries in
structured applications, we usually refer to the components located at the
bottom level of the application: generic data structures and algorithms,
I/O libraries, hardware control, etc.   

This structure is good for pipeline applications, where the high-level flow of
control is specific for every application. However, this structure does not
address the situations when the applications start to share the same high-level
flow, and differ only in the details.

Consider a typical example: the Web server. 


# Hollywood Principle

Queue, 2 examples: polling and listener registration

# Frameworks

# Relation to Dependency Injection





