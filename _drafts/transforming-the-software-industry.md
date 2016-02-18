---
layout: post
title: Gojko Adzic - Transforming the software industry 
---

*In 2015, I attended a ScanAgile conference in Helsinki. The opening talk in
this conference was given by [Gojko Adzic][gojko]. In this talk he presented his
vision on what was going to be a next big change in the software industry. In
this blog post, I'd like to recap some ideas Gojko presents and lay the ground
for future posts. The full video recording of the presentation can be found on
the [YouTube][video-recording].*

# Where we are now - a Factory metaphor

Let’s begin with a historical analogy. At the beginning of the industrial era,
most factory buildings were tall and relatively thin. The reason for such design
was that factory machinery then was driven by steam, and it was the most
efficient structure to have a single big steam generator in the basement. To
deliver steam to machines the cheapest way was to organize them vertically, that
is why factory buildings had multiple floors and relatively small horizontal
area.

When electricity superseded steam generators, the situation changed. With
electrical engines, it doesn't matter how you put the wires - the delivery of
electricity is cheap, and so other constraints start to become critical - for
example, the cost of moving the components across many floors, compared to
moving in horizontal directions. Eventually, with electrical engines the factory
buildings started to become small in height and very wide in the horizontal
direction.

However, there was a transitional period when the benefits of electrical engines
were not fully recognized, and the factory buildings were still designed in a
steam-era fashion - tall and thin, even though this constraint was no longer
valid.

How does that relate to the software industry? Gojko claims that we are now in a
similar transitional phase. While agile approach is widely adopted by the
development teams, the business hasn't yet recognized all its potential and
still operates in an old-fashioned way.

# Water-scrum-fall

Gojko quotes the Forrester Research report saying that the most popular form of
adopting agile approach in organizations is *Water-Scrum-Fall*. In such process,
important business decisions are made and requirements are fixed up-front
(*Water-* phase). These requirements and plans are then taken by the development
teams that implement them into software in the iterative manner (*-Scrum-*
phase). However, the intermediate results are not taken into production until
all the up-front requirements are implemented, and only then the Big Bang
release happens, with all its attributes like marketing campaign, media events
and such (*-Fall* phase).

This organization of work is far from ideal. It doesn't really matter that the
software is implemented in the short increments internally, because the overall
process is still governed by a traditional big up-front planning and long
release schedules. Sure, incremental feature implementation helps keep budget
and time constraints under control, but that's pretty much all we can get from
it. Business still overlooks the opportunities enabled by the fact the
development team produces releasable product with much higher frequency than the
business side of the organization can consume.

# Are we moving too fast? 

From a technical perspective, agile practices let development teams move very
fast. Continuous delivery enables teams to deliver working software in very
short cycles. The problem here, however, is that business people generally do
not want to get the software every two weeks, and there are reasons for their
reluctance.

To release a new version of a product isn't as simple as putting the binaries to
the public web site. Usually, it is accompanied by a lot of other activities:
updating user manuals and web content, training tech support, starting a
marketing campaign, etc. These activities by their nature can't be done every
two weeks, and so there's no interest in getting new product binaries so often.

And that's not only the problem of business guys that they can't move as fast as
development teams. Our end customers may not want to get a new version of the
product every two weeks, either. Nobody likes it when a PDF reader wants to
update when they are in the middle of reading an important document, are they?
In big organizations even a minor software update may require lots of supporting
activities, so big corporate customers are even less interested in getting the
new version of our software every now and then, no matter how awesome the new
features are.

So, there seems to be a controversy between what we can do technically and what
the rest of the world wants us to do. On one hand, we can deploy a new version
of software at the end of each iteration, and there are a lot of good reasons to
do that. On the other hand, we don't want to force-feed our marketing people and
our customers with frequent releases, because that's not how they work; and they
have their reasons to operate this way. 

# Is it a dead-end?

Having all these constraints, it may give an impression that in many situations
Water-Scrum-Fall is all we can get. Should we stop and rest here? Not really.

You see, continuous delivery nowadays is possible at the low cost because over
the past decades we technical people have developed a lot of tools to make it
so. We elaborated a set of practices that enabled it: test-driven development,
continuous integration, requirement splitting, and velocity tracking. We figured
how to attack big technical problems in a manageable way with various design and
refactoring techniques. Along with that, we've developed a toolkit that make all
these activities easy and cheap. Anyone who is only beginning to apply agile
practices these days doesn't start from a blank slate, but is empowered by an
enormous number of tools available, and the experience of the entire community.

Gojko makes a call that we should start to extend our toolkit to invite business
on board with us. It is a challenge for the development community to expand our
practices and tools to enclose a context bigger than just efficient feature
implementation. We need to start working in a direction to prove to the business
people that a) software deployment is easy and cheap, and b) there are a lot of
business opportunities opening up.

There is a number of promising techniques Gojko Adzic bring out in the talk,
which I'd like to observe in later posts. Stay tuned!

[gojko]: https://gojko.net
[video-recording]: https://youtu.be/C9tZLDuPQ7U











