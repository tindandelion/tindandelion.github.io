---
layout: post
title: Bridge Pattern implemented
---

Let's take a closer look on a checkbox. In Swing, it is represented by a class,
conveniently named JCheckBox. It is not a lonely one: it is a part of a big
family. It has a sibling, JRadioButton, and they both inherit from
JToggleButton, which represents a button that can have 2 states. JToggleButton
is a descendant of AbstractButton class, as most buttons are, and all the way up
it's a descendant of JComponent - a parent for all visual components in
Swing. If we take a broader look, we'll see that AbstractButton gives birth to a
whole number of other components, like regular JButton, JMenuItem, and so on. In
a nutshell, what we see is a class hierarchy logically organized around
component's behaviour.

![Check box inheritance][check-box-inheritance]

On the other hand, Swing introduces different look-and-feels its visual
components. There's a platform-independent default Metal look-and-feel, then for
different operating systems there are Windows, Aqua, Motif, and a whole bunch of
others. Let alone the fact that anyone can come up with their own custom visual
style for their application.

A naive approach to addressing this challenge could be to have multiple
descendants of JCheckBox, each representing the checkbox for its look-and-feel: 

![Check box descendants][check-box-descendants]

This solution may work in some contexts, but it suffers a few significant
problems in Swing's case. 

First, by providing multiple subsclasses of JCheckBox, we'd tie our client
applications to particular visual styles. 

The second problem is that visual representation for a component may not fit
nicely into the class hierarchy built around component's behaviour. For example,
one might suppose that from a visual perspective a checkbox and a radio button
may share a lot of visual code, so it may be logical to assume that a checkbox
is an extension of a radio button, or vise versa. However, as we see from the
picture above, in terms of behavior they are quite idependent. 

Third, probabaly the biggest, problem is that this naive approach makes it
difficult to extend the behaviour of the checkbox independently of its visual
representation. Consider, for example, that I want in my application that a
change of the checkbox's state should be accompanied by a sound. In case of the
single JCheckBox class, I'd go along with extending it to, say,
AudibleCheckBox. However, once I have multiple descendants to it, I'm forced
to replicate the same behaviour for each of them, producing
MetalAudibleCheckBox, MotifAudibleCheckBox, and so on. 


[check-box-inheritance]: https://docs.google.com/drawings/d/1QH2ZOBNoqP95-S-JvHvzUnjDlJbtvS-O8qHLi23HP90/pub?w=396&h=232





