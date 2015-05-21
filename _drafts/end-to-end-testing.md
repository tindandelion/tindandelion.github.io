---
layout: post
title: The value of end-to-end tests
---

The idea of automated tests that exercise the system as a whole has been there
since the very inception of agile methods. It appears under diffrent names:
acceptance tests, functional tests, system tests, etc.

However, it's not that popular.

I know only one book on test-driven development that emphasize the value of
system-level tests: [Growing Object-Oriented Software Guided by Tests][goos], by
Matt Pryce and Steve Freeman. In fact, authors go as far as to show on a real
example how this approach fits into development cycle and what value it
brings. This book encouraged me to try this practice and, after a while, I
started to notice the benefits it brings. In this post, I want to share my
experience.

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

# Slice the feature into simple usage scenarios

Usually in the beginning, the feature description is very abstract. 



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

