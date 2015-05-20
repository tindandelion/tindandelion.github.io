---
layout: post
title: The value of end-to-end tests
---

The idea of automated tests that exercise the system as a whole has been there
since the very inception of agile methods. It appears under diffrent names:
acceptance tests, functional tests, system tests, etc.

However, it's not that popular.

I know only one book on test-driven development that emphasize the value of
system-level tests: [Growing Object-Oriented Software Guided by Tests][goos], by
Matt Pryce and Steve Freeman. In fact, authors go as far as to show on a real
example how this approach fits into development cycle and what value it
brings. This book encouraged me to try this practice and, after a while, I
started to notice the benefits it brings. In this post, I want to share my
experience.

# Terminology

System-level tests come under different names, depending on what aspect of their
value authors want to emphasize: system tests, end-to-end tests, acceptance
tests, etc. That brings some mess into understanding. For instance, not all
acceptance tests must be end-to-end. Conversely, not all end-to-end tests can be
called acceptance tests.

As I refer to GOOS book, I'll stick to the terminology it uses. In GOOS,
end-to-end tests have the following important properties:

- they exercise the application from their natural boundaries;
- they are expressed in terms of problem domain language.

So, I guess, the precise name for such kind of test should be "system-level
acceptance tests". For sake of brevity, I'll call them ... tests in this post.

# Slice the functionality into usage scenarios

When we start working on a piece of functionality, it's usually represented as a
very abstract idea. For example, "The system must automatically backup the
database every day". More othen than not, it's not clear where to start
development from. 

# Deteremine the system boundaries

Starting from the end-to-end test forces me to search for the system
boundaries. 

# Avoid premature design desicions



[goos]: http://www.growing-object-oriented-software.com

