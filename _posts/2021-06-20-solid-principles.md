---
layout: post
title: "Clean Architecture by Robert Martin: The Principles of Architecture. Part I"
---
In the [episode 65][episode-65] Uncle Bob reviews SOLID and Component principles, and discusses how they affect the architecture. In [the book][ca-book] it corresponds to parts III and IV. I've decided to split my review in two parts as well, since there's a lot to cover. This post will cover SOLID principles, that guide software design on a module level.

I regard SOLID principles as a next-level skill for the software developers. They're definitely not for beginners. Unlike *practices*, which are specific and well-defined, design principles are vague and rather abstract. Maybe you can pinpoint the essence of a principle in a few sentences, but then it takes pages to unpack its meaning. It's no coincidence, that Uncle Bob, despite his claim that in this book there's only a overview, dedicates a whole chapter for each. 

Because of the principles' vagueness, it's not always clear how to apply them in practice. Uncle Bob usually illustrates each principle with the example of *its violation*, and what consequences the violation has. I've found this approach also quite useful in the daily routine. 

It usually occurs to me that the code violates this or that principle, when I'm stuck with a problem to modify it. Given a task to update the existing code, I take some time to analyze what modules need to change, and whether the change makes sense, considering its nature and the nature of affected modules. For example, if a change in one particular subsystem induces modifications throughout the entire code base, there's definitely a violation of SOLID principles lurking somewhere. Then I try to get to the root of the problem, to see which principle is violated, and where. Often, it's several of them, since they are interconnected. After the offended principle(s) is identified, I refactor the existing code to better design, and finally implement the change that was asked for.

Sometimes, it's also a good exercise to try to keep both behaviours, old and new, in the code. Such exercise, when you force yourself to preserve both behaviours, encourages you to generalize the affected code enough to accommodate both, for example by splitting out the affected code into a separate class, and having two implementations for old and new versions. Even though the old version will go away eventually, the change in the code structure will make future modifications of that kind easier. This exercise works particularly well with driving the code to conform to Open Closed Principle. 

Other times, unit tests can be a good source of information. When a test setup becomes too complicated, it's a good sign that there's something wrong with the module under the test: probably it knows too much about the low-level details. 

## Single Responsibility Principle 

This principle is often misunderstood because of its ambiguous name. People usually think that it is about the module doing just one thing. However, that's not the case: SRP is about *to who the module responds*:

> A module should be responsible to one, and only one, actor. 

SRP is all about why the module may need to change, and what other parts of the system that change may affect. It implies that the reason for the module to change is the modification in its actor's requirements. If other unrelated actors also depend on that module, they'll be affected by that too, often quite unexpectedly. It also may happen that the requirements of one actor become incompatible with others. So, if you want to control the impact of the modification, the best situation is that the module under modification is responsible only to the actor that asks for that modification. 

This principle also implies that the code should be arranged in the modules depending on *who uses* that code, not *what the code does*. 

#### Impact on architecture

* The architecture of the system is dictated by the structure of its users;
* Surprising corollary: by the inversion of [Conway's law][conways-law], the organization of the development team will be affected by the organization of the users.

## Open Closed Principle

> A module should be open for extension, but closed for modification.

This principle means, that we should be able to extend the behaviour of a module, without changing the source code of the module itself. The goal of this principle is to build an architecture that is easy to extend without major disturbances to the existing code base. We do that by separating the high-level code of the module (that changes rarely) from low-level details (that is more probable to change).

#### Impact on architecture

* The system is separated into the component structure, where each component defines its extension points (abstract classes or interfaces);
* We extend the component's behaviour by deriving from its abstract classes, or by implementing the extension interfaces;
* The component dependency hierarchy is organized so, that low-level components depend on high-level components, making the latter protected from changes in low-level details.

## Liskov Substitution Principle

LSP is a principle that's formulated in a very pedantic and obscure way, but in fact it is very clear what it means in practice. Here's the definition Uncle Bob gives in the video: 

> Subtypes must conform to the contract that the users of supertype expect of them.

Practically it intuitively means that the subclasses of a base class, or the implementations of an interface should be totally interchangeable without making the modifications to the code that uses the base class. Of course, in statically typed languages it is partially achieved by format type checks. But still, there is a possibility to provide such implementations, that would pass the compiler checks, but still have surprising side-effects, incompatible with the calling code. 

LSP informs a few suggestions to the design: 
* Don't put methods into abstract base classes or interfaces, that only make sense to particular implementations;
* Don't implements the methods in a way that's incompatible with other implementations.

#### Impact on architecture

On the architectural level, LSP suggests that we should be able to provide different implementations of a component without changing the rest of the system.

## Interface Segregation Principle

Simply put, ISP advocates for creation of narrow cohesive interfaces for different users of the module. 

> Don't depend on things you don't need

For example, often developers of a shared service module create a "wide" interface that contains functions to serve *all* kinds of users. Inadvertently, every user becomes dependent on *all* the functions in that interface, even though they may not need them. Such interface becomes a pain point in the system, since any change in it makes *all* dependent modules to recompile and redeploy. What we should do instead is to split this "fat" interface into a few "narrow" ones, each serving its own clients.

This principle suggests the the following rules: 
* Don't create fat generic interfaces, when only a small subset of methods is needed by different clients;
* Create interfaces that are tailored to clients' needs.

## Dependency Inversion Principle

This principle is commonly mistaken for "Dependency *Injection* Principle". However, they are completely different things. 
Dependency inversion principle specifies the direction in which the source code dependencies should be pointing to: 

> Modules that contain high-level policies, should not depend on the modules that contain low-level details. 
> Source code dependencies should always point towards high-level policies, even when the flow of control goes in the other direction.

In fact, there are different interpretations of this principle, depending on what properties of the source code you want to focus on. In addition to "high/low level" dichotomy, there's a couple others:
* **Abstract/concrete dichotomy.** You want the dependencies point in the direction of higher level of abstraction. In other words, abstract classes should not depend on anything concrete;
* **Stable/volatile dichotomy.** You want volatile code to depend on the stable code, not vice versa. 

The "stable/volatile" dichotomy probably best captures the goal of this principle. The idea is that, since volatile code changes often, you don't want these changes to affect more stable parts of the system. 

This principle is impossible to follow to a tee in abstract/concrete interpretation. There will always be dependencies to concrete implementations from the abstract code - think about string utilities, or date/time libraries. It's ok as long as these concrete libraries are stable. It's *volatile* code that should be taken care of.

[episode-65]: https://cleancoders.com/episode/clean-code-episode-65
[ca-book]: https://www.goodreads.com/book/show/18043011-clean-architecture
[conways-law]: https://en.wikipedia.org/wiki/Conway%27s_law