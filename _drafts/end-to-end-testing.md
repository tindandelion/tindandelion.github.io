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
best, what we get is 'integration tests' or 'system tests', often written after
the fact. Sometimes, the concept is deluded as much as having an entirely
separate team of 'test automators' who write 'test automations' on a ready
product.

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

# Start with a walking skeleton

Usually, when I start working on a feature, I pick a simplest scenario that
would go through the application from one end to another. Then, I examine it and
try to remove any unnecessary detail.

Usually, when I start working on a feature, I ask myself a question: 'What would
be the simplest scenario that'd go through the application from one end to
another?'. Most of the time, such scenario lies on the surface. The next
question is much harder to answer: 'Is there any detail I can remove from the
scenario to make it even simpler?'. 

The point of the first acceptance test is to get you started, not necesssarily
to bring business value. 





[goos]: http://www.growing-object-oriented-software.com

