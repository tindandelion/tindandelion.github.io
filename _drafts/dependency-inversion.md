---
layout: post
title: On Dependency Inversion Principle
---

# Why dependencies matter?

# The definition

Let's return to the roots and consider the definition of the principle, given by
Robert Martin in the [C++ Report article][martin] in 1996:

> **A.** High level modules should not depend upon low level modules. Both
> should depend upon abstractions.
>
> **B.** Abstractions should not depend upon details. Details should depend upon
> abstractions.

Actually, both parts of this principle are huge topics to explore. These days, a
lot is told and learned about abstraction/detail separation, so to narrow the
scope, I'd like to focus on the part A of this principle. I think it's very
relevant to discuss because module dependencies are very often overlooked by
developers, which leads to trouble with dependencies. 

# Dependency, direct



# Dependency, inverted

# Is is a repetition of IoC?

I described the Inversion of Control principle in my last post. Haven't I just
repeated myself with DIP? Well, yes and no.



[martin]: http://www.objectmentor.com/resources/articles/dip.pdf
