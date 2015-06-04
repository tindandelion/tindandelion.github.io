---
layout: post
title: The importance of acceptance tests in test-driven development
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
and how they help drive the application development on a higher level.

Since then, I've been applying this practice wherever it was possible. I noticed
that following it changed the way I approached problems in a number of ways. By
this post, I'd like to open a conversation about the benefits developers get
when systematically applying the practice of acceptance test driven development
in their process, and the techniques how to do it systematically.

# The properties of good acceptance tests

The term *acceptance test* have attracted different meanings for different
people, so I feel I need to clarify what I mean by 'acceptance test', inspired
by the GOOS book. Here are two properties of such kind of tests that play a
crucial role:

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
system into modules is a part of the design process. And here's the trap: I want
tests to drive my design, but I need to have some design to start writing
tests. Chicken or egg? To me, this was a problem that prevented me from
accepting TDD as a primary design technique.

Writing acceptance tests helps solve this dilemma naturally. On one hand, they
treat the system under development as a black box, letting you move on without
reasoning about the internal system structure. On the other hand, you use the
application's problem domain as a source of information and a driver for writing
tests. Both these properties help you start working on the problem, yet defer
design decisions until the moment you have a piece of code that demands it. No
more 'whiteboard programming' to pick the design out of the thin air is
required.

# Design outside-in

There is a certain kind of design decisions acceptance tests force me make
immediately: how the boundaries of the application look like. Consider a simple
(if not cliche) example that executes the scenario of a user logging into the
system:

{% highlight java %}
@Test
public void userLogsIn_successfully() throws Exception {
   final User user = new User("john-smith", "password");

   ensureUserExists(user);
   loginAsUser(user);
   assertThat(application, loggedInAs(user, withCurrentScreen(welcome())));
}
{% endhighlight %}

Suppose it's the very first acceptance test for the application, so there's no
production code yet at all. Having this scenario written, it forces me to answer
the question: how the tests are going to initiate actions in the application and
observe the results? What code may lie beneath these `ensureUserExists()`,
`loginAsUser()` and `loggedInAs()` functions? In other words, what are the
*boundaries* of the system through which the tests will manipulate it and assess
the state?

Sometimes the boundaries are dictated by the requirements, but often it's not
that obvious. For instance, user interface can be one of such boundaries, and
with the help of an appropriate tool (Selenium, WindowLicker) tests can interact
with the application as a real user would do. However, it's not the only way to
achieve the same result, and probably different design techniques are required
to bypass the UI layer without the loss of test coverage.

Discovering application boundaries is an important design activity because it
helps me build a layer around the application that would isolate the core
functionality (which we usually have control of) from the outside world (which
tends to change independently of my will). In that regard, acceptance tests
help me drive the isolation and also serve as a measure of quality of it.

# It is not that hard

For me, the major blocker that had stopped me from writing acceptance tests was
the percieved complexity of this task. Indeed, when you look at the application
you've built, real or imaginary, it seems too difficult to even start: too many
secondary technical problems must be solved before you begin to get anything
meaningful in return.

This, however, turns out to be a jigsaw paradox: when you look at the assembled
jigsaw puzzle of thousand pieces, it feels an enormous amount of effort. When
you start from scratch, however, you quickly discover that there are several
pretty simple techniques that, applied systematically, guide you to the
solution.

The same is true about acceptance tests. If you start from the beginning and
follow some pretty simple techniques, this task turns out to be quite
feasible. As your application grows, the complexity of the tests can build up,
too. The good thing is that it increases in a manageable way and can be
addressed with the same tools you use to manage the complexity of the production
code.

# To be continued

The subject of acceptance testing (and test-driven development in general) is
too big to be covered by one blog post, or even ten. By this article, I intend
to start a conversation about this topic and continue to delve into following
the feedback I receive. [Stay tuned]({{ site.baseurl }}/feed.xml) if you're
interested!

[goos]: http://www.growing-object-oriented-software.com
[xp-explained]: http://www.amazon.com/Extreme-Programming-Explained-Embrace-Edition/dp/0321278658/ref=dp_ob_title_bk
