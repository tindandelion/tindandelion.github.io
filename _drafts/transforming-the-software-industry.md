---
layout: post
title: Transforming the software industry
---

*In early 2015, I attended a ScanAgile conference in Helsniki. The keynote talk
on this conference was given by [Gojko Adzic][gojko], in which he presented his
vision on what was going to be a next big change in the software industry. This
blog post is a recap of his talk. The full video recording of the presentation
can be found [here][video-recording].*

# Where we are now - a Factory metafor

Let’s begin with a historical analogy. At the beginning of the industrial era,
most factory buildings were tall and relatively thin. The reason for such design
was that factory machinery then was driven by steam, and it was the most
efficient structure to have a single big steam generator in the basement. To
deliver steam to machines in a most efficient way was to organize them
vertically, that is why factory buildings had multiple floors and relatively
small horizontal area.

When electricity superceded steam generators, the situation changed. With
electrical engines, it doesn’t matter how you put the wires - the delivery of
electricity is cheap, and so other constraints start to become critical - for
example, the cost of moving the components across many floors, compared to
moving in horizontal directions. Eventually, with electrical engines the factory
buildings started to become small in height and very wide in area. 

However, there was a transitional period when the benefits of electrical engines
were not fully recognized, and the factory buildings were still designed in a
steam-era fashion - tall and thin, even though this constraint was no longer
valid.

How does that relate to the software industry? Gojko claims that we are now in a
similar transitional phase. While agile approach is widely adopted by the
development teams, the business hasn't yet recognized all its potential and
still operates in an old-fashined way.

# Water-scrum-fall

Gojko quotes the Forrester Research report saying that the most popular form of
adopting agile approach in organizations is *Water-Scrum-Fall*. In such process,
important business decisions are made and requirements are fixed up-front
(*Water-* phase). These requirements and plans are then taken by the development
teams that implement them into software in an iterative manner (*-Scrum-*
phase). However, the intermediate results are not taken into production until
all the up-front requirements are implemented, and only then the Big Bang
release happens, with all its attributes like marketing campaign, media events
and such (*-Fall* phase).

When work is organized this way, it doesn't really matter that the software is
implemented in the short increments internally, because the overall process is
still governed by a trditional big up-front planning and long release
schedules. Sure, incremental development helps keep budget and time constraints
under control, but that's all we can get from it. Business still overlooks the
opportunities enabled by the fact the development team produces releasable
product with much higher frequency than the business side of the organization
can consume.

# Are we moving too fast? 

From a technical side, agile practices let development teams move
faster. Continuous delivery enables teams to deliver working software in very
short cycles. The problem here, however, is that business people generally do
not want to get the software every two weeks. To release a new version of a
product isn't usually as simple as putting the binaries to the public web
site. Usually, it is accompanied by a lot of other activities: updating user
manuals, updating web sites, training tech support, starting a marketing
campaign, etc. These activities by their nature can't be done every two weeks,
and so there's no interest in getting new product binaries every two weeks.

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

# Release late, deploy often

One thing we should start doing is to decouple the release event from the
deployment event. We realize now that the release is a business-driven event and
there are lots of constraints that prevent doing it frequently. On the other
hand, the deployment of a software update into production is mostly a technical
problem. There is a lot of work going on in the software community to enable
that thing like feature flags, shadow deployments, and so on.

But that's not all of that. Not only should we separate the release and the
deployment, but we also need to start taking business people on board. We need
to prove to the business guys that a) software deployment is cheap and easy, and
b) there are a lot of business opportunities opening up.

One particularly interesting aspect that's starting to become possible these
days is *multiversioning*, which means that multiple versions of the product can
co-exist in production.











