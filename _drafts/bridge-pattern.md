---
layout: post
title: Bridge design pattern, implemented in Swing 
---

I've been working with Java Swing framework lately a lot. While doing my daily
work, I tried hard to find a subject I'd like to discuss with my fellow
teammates. It took me a while to realize that what I was looking at is an
interesting application of a *Bridge* design pattern; the pattern I remembered
by name, but always had problems remembering the specifics.

# The problem

Let's take a closer look at a checkbox. In Swing, it is represented by a class,
conveniently named `JCheckBox`. It is not a lonely one: it is a part of a big
family. It has a sibling, `JRadioButton`, and they both inherit from
`JToggleButton`, which represents a button that can have 2 states. `JToggleButton`
is a descendant of `AbstractButton` class, as most buttons are, and all the way up
it inherits from `JComponent` - a parent for all visual components in
Swing. If we take a broader look, we'll see that `AbstractButton` gives birth to a
whole number of other components, like regular `JButton`, `JMenuItem`, and so on. In
a nutshell, what we see is a class hierarchy logically organized around
component's behaviour.

![Check box inheritance][check-box-inheritance]

On the other hand, Swing introduces different look-and-feels its visual
components. There's a platform-independent default Metal look-and-feel, then for
different operating systems there are Windows, Aqua, Motif, and a whole bunch of
others. Let alone the fact that anyone can come up with their own custom visual
style for their application.

# The solution which is simple and wrong

A naive approach to addressing this challenge could be to have multiple
descendants of `JCheckBox`, each representing the checkbox for its look-and-feel: 

![Check box descendants][check-box-descendants]

This solution may work in some contexts, but it suffers from a few significant
drawbacks in Swing's case. 

The first problem is that this naive approach makes it
difficult to extend the behaviour of the checkbox independently of its visual
representation. Consider, for example, that I want in my application that a
change of the checkbox's state should be accompanied by a sound. In case of the
single `JCheckBox` class, I'd go along with extending it to, say,
`AudibleCheckBox`. However, once I have multiple descendants to it, I'm forced
to replicate the same behaviour for each of them, producing
`MetalAudibleCheckBox`, `MotifAudibleCheckBox`, and so on. 

The second problem is that visual representation for a component may not fit
nicely into the class hierarchy built around component's behaviour. For example,
one might suppose that from a visual perspective a checkbox and a radio button
may share a lot of visual code, so it may be logical to assume that a checkbox
is an extension of a radio button, or vise versa. However, as we see from the
picture above, in terms of behavior they are quite idependent. 

Finally, by forcing the clients instantiate specific subclasses of `JCheckBox`,
we'd tie our client applications to the particular look-and-feel. Ideally,
clients should be able to create a checkbox without committing to a concrete
implementation, thus being independent of particular implementations.

# Decouple looks from behaviours

In a nutshell, what we observe here is that a checkbox is a creature with
multiple facets, and each of them may evolve idependently. From one standpoint,
checkbox is a toggle button with all its (and, transitively, button's)
behaviour. From the other, it's something that's displayed in the screen, and
this aspect may have totally different abstraction-detail structure. It's quite
easy to imagine that a checkbox may have even more aspects, like sound effects,
which in turn is independent of its visual capabilities and general button
behaviour.

The problem here is that these different aspects do not fit nicely into a single
inheritance structure. Speaking metaforically, entities like that have *multiple
degrees of freedom* to evolve, while inheritance relationship can adequately
represent only one of them. What we want here is multiple inheritance
structures, each representing an independent aspect of behaviour, and each being
able to evolve independently. And that constitues a *Bridge design pattern*. 

Take a look at how it's implemented in Swing:

![Bridge pattern in Swing][swing-bridge]


[check-box-inheritance]: https://docs.google.com/drawings/d/1QH2ZOBNoqP95-S-JvHvzUnjDlJbtvS-O8qHLi23HP90/pub?w=793&h=463
[check-box-descendants]: https://docs.google.com/drawings/d/1_xePGqlAUELPcrFzN7QrWQ0h4ME-1umUKkN0ZZpQGQg/pub?w=542&h=240
[swing-bridge]: https://docs.google.com/drawings/d/1fvnC3ZS3a39iUhp9dtAAbCCLoryzu9rE5iVkEyGBMSg/pub?w=527&h=242





