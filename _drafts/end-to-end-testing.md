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
problem domain. When following the practice of *test-driven development* (which
I regard as **the way** of writing automated tests), these scenarios naturally
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

# The properties of good acceptance tests

The term *acceptance test* have attracted different meanings for different
people, so I feel I need to clarify what I mean by 'acceptance test'. Here are
two properties of such kind of tests that make them stand out:

- they treat the system under test as a black box, performing the manipulations
from the outside the system's world;
- they are expressed in terms of application's domain model.

Let me explain why I think these properties are important.

# Test outside-in

I had a conversation about TDD recently where my counterpart claimed that TDD
was 'methodologically incomplete'. His point of view was very valid for doing
TDD on a unit level only.

When you're used to writing unit tests only, it feels like sometimes you're a
victim of a 'catch-22'-type trap. Indeed, the rules of TDD prescribe that tests
must be the source of our design desicions. However, in order to start writing
unit tests, I already need to have some design in place, because decomposing the
system into unit is a part of the design process. And here's the trap: I want
tests to drive my design, but I need to have some design to start writing
tests. Chicken or egg? To me, this was a problem that prevented me from
accepting TDD as a primary design technique.

Writing acceptance tests helps solve this dilemma gracefully. On one hand, they
treat the system under development as a black box, which lets you move on
without reasoning about the internal system structure. On the other hand, you
use the application's problem domain as a source of information and a driver for
writing tests. Both these properties help you start working on the problem, yet
defer your design decisions until the moment you have a piece of code that
demands it. No more 'whiteboard programming' to pick the design out of the thin
air is required.

# Design outside-in

There is a certain kind of design decisions acceptance tests force you to make
right away: how the boundaries of the application look like. Consider a simple
(if not cliche) example that executes the scenario of a user logging into the
system:

{% highlight java %}
@Test
public void userLogsIn_success() throws Exception {
   final User user = new User("john-smith", "password");
   ensureUserExists(user);

   loginAsUser(user);
   assertThat(application, loggedInAs(user, withCurrentScreen(welcome())));
}
{% endhighlight %}

Suppose it's the very first acceptance test for the application, so there's no
production code yet at all. Having this scenario written, it forces me to answer
the questions like: 



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
[xp-explained]: http://www.amazon.com/Extreme-Programming-Explained-Embrace-Edition/dp/0321278658/ref=dp_ob_title_bk
