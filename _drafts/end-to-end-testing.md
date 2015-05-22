---
layout: post
title: The value of end-to-end tests
---

The idea of automated acceptance tests has been there since the very inception
of agile methods. Even the earliest book I can refer to,
[Extreme Programming Explained][xp-explained], mentions automated 'functional'
tests. Since then, the same idea re-appeared on the horizon under different
names: acceptance tests, executable specifications, system tests, integration
tests, etc. The main idea remained the same: develop a set of automated
scenarios that examine the system as a whole, and are expressed in terms of the
problem domain. When following the practice of test-driven development (which I
regard as **the way** of writing automated tests), these scenarios naturally
come before the production code is written.

This idea, although popular in minds, rarely gets implemented in practice. At
best, what we get is 'integration tests' or 'system tests', written after the
fact. Sometimes, the concept is deluded as much as having an entirely separate
team of 'test automators' who write 'test automations' on a ready product.

I must confess that I wasn't an exception. I had practiced TDD for several years
and considered myself an 'experienced TDDer', but still viewed accepatance tests
as an optional thing one can easily go without. The turning point for me was a
book by Nat Pryce and Steve Freeman,
[Growing Object-Oriented Software Guided by Tests][goos]. This book stands out
because a big deal of it is dedicated to an example of using TDD for developing
a real-world application with user interface and network communications. Their
example finally showed to me where acceptance tests belong to in a system of TDD
and how they help to drive the application development on a higher level.

Since then, I've been applying this practice wherever it was possible. I noticed
that following it changed the way I approached development problems in several
ways. By this post, I'd like to open a series that describes what benefits
developers get when systematically applying the practice of acceptance test
driven development in their process.

# Terminology

System-level tests come under different names, depending on what aspect of their
value authors want to emphasize: system tests, end-to-end tests, acceptance
tests, etc. That brings some mess into understanding. For instance, not all
acceptance tests must be end-to-end. Conversely, not all end-to-end tests can be
called acceptance tests.

As I refer to GOOS book, I'll stick to the terminology it uses. In GOOS,
end-to-end tests have the following important properties:

- they exercise the application from their natural boundaries;
- they are expressed in terms of problem domain language.

So, I guess, the precise name for such kind of test should be "system-level
acceptance tests". For sake of brevity, I'll call them ... tests in this post.

# Vertical feature slicing






# Avoid premature design desicions



When doing TDD only on a unit level, at the beginning you are trapped in a
Catch-22 style: tests should drive your design decisions, but in order to start
writing unit tests, you need to have some level of unit decomposition in
place. For me, that sometimes resulted in a significat amount of time when I was
trying to pull some sort of the design out of thin air, only to find out later
that I missed some aspect that ruined my efforts.

Starting with an acceptance test helps avoid this trap. On one hand, acceptance
tests constrain the observable behaviour of the application, leaving me a lot of
freedom to decide on the implementation. On the other hand, they don't require
me to make these decisions in order to start coding. Combined with my previous
point about small user scenarios, that means I can move on in tiny increments,
doing just enough design work to keep codebase clean.

The focus on the observable behaviour also serves as a safety net later, if I
decide to change the internal design for some reason.

# Discover the application boundaries

One important property of acceptance tests is that I want them to exercise the
application from the outside, as out as possible. This forces me to think about
how tests will interact with the application, from different points of view.

From the problem domain perspective, acceptance tests require me to answer the
questions like: what initiates the desired flow of actions? Where in the system
the scenario begins and where it ends? What's the state of the system at the
beginning and at the end? How does it looks from the user's point of view?

On the impkementation level, I'm required to answer the questions like: through
what gateways the tests will interact with the application? Is it enough to talk
only through the user interface? Does the scenario invokes any system external
to the application? If so, can I use a real instance or it needs to be faked
somehow? Are there any important hidden variables that need to be accessible
from the test code?

There's a whole lot of questions, but the good thing is that I don't need them
all answered at once. As I write one test after another, I think only about the
aspects required by the test I'm currently working on. Later, when the code is
in place and the test passes, I can reflect on the decisions I made and do some
refactoring, if necessary.



[goos]: http://www.growing-object-oriented-software.com

