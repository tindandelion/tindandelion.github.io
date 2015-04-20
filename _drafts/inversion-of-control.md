---
layout: post
title: Inversion of Control principle explained
---

I've had a 'water cooler chat' with my teammates recently, and occasionally one
of us mentioned that he never understood the concept of 'Inversion of Control'.
We all started to give our own explanations but, to my surprise, nobody could
give anything better than hand-waving and a mumble 'The flow of control is
inverted, and so...'. Oh, and one thing everyone remembered was that
[Dependency Injection](http://en.wikipedia.org/wiki/Dependency_injection) is a
good illustration of the IoC, thanks to the
[great article](http://martinfowler.com/articles/injection.html) by Martin
Fowler on the subject.

I was no better than the others, having realized suddenly that I couldn't
soundly explain even why this principle was called so. Then I decided to spend
some time filling the blanks in my education. This post is my report based on
the study I've made.

# What's in a name?

The biggest problem of explaining the meaning of IoC is that nowdays it's used
everywhere and considered 'obvious' by many. However, there was time when a huge
mind shift was required for this new style of application design to be widely
adopted.

Back in the 80's, the most popular style of application design was *structured
design*. Structured design is a top-down approach: you start with the `main`
routine that defines the high-level flow of your program. Then you define
subroutines invoked by `main`, then subsubroutines those subroutines call, and
so forth, ending up with the hierarchy shown in the picture.

The remarkable thing about this structure is the level of detail presented on
each layer. Our `main` routine represents the high level policies and and
controls the entire program's flow. The deeper down the hierarchy we go, the
more detail. At th every bottom, we finish up with such libraries as string
operations, I/O functions, math libraries, etc. 

This structure is good for pipeline applications, where the high-level flow of
control is specific for every application. However, this structure does not
address the situations when the applications start to share the same high-level
flow, and differ only in the details.

Consider a typical example: the Web server. 


# Hollywood Principle

Queue, 2 examples: polling and listener registration

# Frameworks

# Relation to Dependency Injection





