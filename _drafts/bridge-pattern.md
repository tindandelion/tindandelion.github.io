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
style for their application, call it MyAwesomeLookAndFeel. 

[check-box-inheritance]: https://docs.google.com/drawings/d/1QH2ZOBNoqP95-S-JvHvzUnjDlJbtvS-O8qHLi23HP90/pub?w=396&h=232





