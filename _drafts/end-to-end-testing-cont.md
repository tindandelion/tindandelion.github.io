
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

