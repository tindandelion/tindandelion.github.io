---
layout: post
title: The origins of Inversion of Control principle
---

I've had a 'water cooler chat' with my teammates recently, and occasionally one
of us mentioned the concept of *Inversion of Control*.  We all started to give
our own explanations but, to my surprise, nobody could give anything better than
hand-waving and a mumble 'The flow of control is inverted, and so...'. Oh, and
one thing everyone remembered was that
[Dependency Injection](http://en.wikipedia.org/wiki/Dependency_injection) is a
good illustration of the IoC, thanks to the [great article][fowler-injection] by
Martin Fowler on the subject.

I was no better than the others, having realized suddenly that I couldn't
soundly explain even why this principle was called so. Then I decided to spend
some time filling the blanks in my education. This post is my report based on
the study I've made.

# What's the problem?

The biggest problem with explaining the meaning of IoC is that nowadays it's used
everywhere and considered 'obvious' by many, because it lies in the foundation
of nearly every framework popular these days. In fact, it was this principle
that enabled the idea of a 'framework' itself.

The other fact that doesn't contribute to understating is that usually the IoC
principle is described in conjunction with Dependency Injection pattern, which
narrows the idea too much to grasp the whole principle. Somehow we forget that
Dependency Injection is only one implementation of this quite general idea.

# A bit of archaeology

Let's go back in the past and turn our attention to the
[article](http://www.laputan.org/drc/drc.html) that, according to Fowler,
introduces this principle:

> One important characteristic of a framework is that the methods defined by the
> user to tailor the framework will often be called from within the framework
> itself, rather than from the user's application code. The framework often plays
> the role of the main program in coordinating and sequencing application
> activity. This **inversion of control** gives frameworks the power to serve as
> extensible skeletons. The methods supplied by the user tailor the generic
> algorithms defined in the framework for a particular application.


At this point, if you are smarter than me, you should scream "Aha!". If so, just
skip the rest of this post. However, if you are like me and feel this is still
too obscure, let's move on and figure out what this all is about.

# Being direct

Back in the 80's, the most popular method of software decomposition was
*structured design*. Structured design is a top-down approach: you start with
the `main` routine that defines the high-level flow of your program. Then you
define subroutines invoked by `main`, then sub-subroutines those subroutines
call, and so forth, ending up with the hierarchy shown in the picture.

![Direct control flow][direct-flow]

It is assumed in this structure that you, the application developer, are
responsible for writing the `main` routine and high-level procedures it
invokes. As for reusable libraries, they tend to stick to the lower levels of
abstractions: command line parsing, general data structures and algorithms,
input/output libraries, etc. Those libraries usually play passive 'helper'
roles. The central orchestration is always provided by the application's
developer. The flow of control always go from top to bottom, from the
application-specific code to the lower-level generic reusable libraries. We call
this **the direct flow of control**.

# Getting inverted

The approach described above is fine for writing batch-style applications, where
the flow of control is totally determined by the application's
developer. However, it falls short when we start developing modern UI-based (or
Web-based, for back-end geeks) applications. In applications of this kind, the
main routine is almost identical for every application. Essencially, it's just an
event loop that receives events from an operating system and dispatches them to
application-specific event handlers.

To address the problem of writing a reusable library for such kinds of
applications, we need to take `main` routine along with the high-level
orchestration from the developer provided code, and put it into a reusable
library:

![Inverted control flow][inverted-flow]

Notice the remarkable change that happens here. Earlier, we had
application-specific code that called third-party libraries. Now we have most
calls going in the opposite direction: from a third-party library to the
application-specific code. This approach was fresh and new, enabled by the
concept of *polymorphism* and popularized by object-oriented languages. And so
it received a name **Inversion of Control**, as opposed to 'traditional' direct
control flow.

# Frameworks

Armed with IoC principle, we can develop a library that would contain the
high-level logic of application orchestration. This library can be reused across
all applications of a similar type. Application-specific behavior is provided by
*extending* the basic control flow. In other words, the application developers
now provide their code in form of *plugins*.

Such architectures are very popular nowadays, and libraries that dictate the
high-level application behavior got their own family name: **frameworks**.

# Hollywood's Law

Even before we started to call it 'the inversion of control', it had been known
as a *Hollywood's law*:

> Don't call us, we'll call you.

For those of us unfamiliar with the cruel world of show business industry: it
was a cliche response given by Hollywood producers to novice actors after the
audition.

This colorful metaphor, which sends us back to 1983's [article][mesa], for a
software developer means the following:

> The flow of control is an implementation detail and should be captured from
> the client code. The client code is given the control only when specific
> actions are required.

# The scope

The inversion of control not necessarily works only in the big scope. It is
perfectly applicable in the scope of a class or even a single function. Consider
the example from Java 8 stream library:

{% highlight java %}

public void processStream(Stream<String> values) {
  values
    .filter(s -> s.startsWith("c"))
    .forEach(System.out::println);
}
	
List<String> myList = Arrays.asList("a1", "a2", "b1", "c2", "c1");
processStream(myList.stream())
	
{% endhighlight %}

Java 8 streams are a perfect illustration of IoC principle working 'in
small'. What happens in this code snippet is that the generic flow of control -
iteration over a collection - is hidden from the client code. However, the
specifics of iteration - the predicate in `filter` and the reference to
`println` in `forEach` - are provided by the client code to serve its specific
needs.

The benefit of such approach is that the internal implementation of the stream
can alter without changing the client code. In our case, we made a stream of a
list of values. However, the same code will work for a stream that uses a
different iteration strategy: picks random elements, or traverses a binary tree, or
even creates the values on the fly.  What goes on inside does not bother the
client as long as `filter` and `forEach` are invoked as expected.

As a side note: Java's stream library is a remarkable example of how the
principle that originated in 1980 finally found general public acceptance in
2014. This certainly proves that the idea has stood the test of time!

# Relation to Dependency Injection

For some mysterious reason, nowadays the concept of IoC goes in conjunction with
**Dependency Injection** technique. I can't explain why, probably because the
inversion of control is too abstract to grasp, while dependency injection is a
concrete technique. Or, maybe it's Martin Fowler who's to praise (or blame) for
connecting these two things in a [great article][fowler-injection]. Nonetheless,
I feel I need to dedicate a couple of paragraphs to that subject.

So, what's dependency injection and how the control is inverted here? Let's
consider it by example I've shamelessly stolen from a
[book by Sandi Metz][poodr].

Imagine we have a class that represents a bicycle. The bicycle is a complicated
machine, but for our purposes let's focus on two components: gear control and
brakes. Those components are represented by `Gear` and `Brake` classes,
respectively.

{% highlight java %}

public static class Bicycle {
  private Gear gear;
  private Brake brake;

  public Bicycle() {
    this.gear = new Gear();
    this.brake = new Brake();
  }
}

{% endhighlight %}

The code snippet above represents the *direct flow* of object construction: in
its constructor, our `Bicycle` class creates instances of `Gear` and `Brake`
classes; therefore, the `Bicycle` takes full control of initializing its
components.

Now, let's consider a slightly different example:

{% highlight java %}

public static class Bicycle {
  private Gear gear;
  private Brake brake;

  public Bicycle(Gear aGear, Brake aBrake) {
    this.gear = aGear;
    this.brake = aBrake;
  }
}

{% endhighlight %}

In this example, a `Bicycle` instance receives its sub-components from the
outside. Effectively, we are taking the responsibility of initializing the
sub-components from the `Bicycle` class, and place it somewhere else. From the
bicycle's standpoint, the flow of control is *inverted*: if previously it had full
control over initializing its sub-components, now they come *from the outside*,
which means the control is taken from it and placed to the outer scope. 

So, in case of dependency injection pattern, what gets inverted is the flow of
object initialization. The benefits of this start to reveal when we shift
towards using gears and brakes as abstract concepts, but I feel it's a big topic
in itself, so I'll stop contemplating dependency injection at this point.

---

I hope this rather lengthy review was useful to my readers in understanding the
concept of Inversion of Control. Thanks for your attention, have fun and enjoy
coding!

[fowler-injection]: http://martinfowler.com/articles/injection.html 
[direct-flow]: https://docs.google.com/drawings/d/1SSfH6AzZM8D29UGZVrjOXuR7woOjuLshkX_rqZgWS4Y/pub?w=647&amp;h=435
[inverted-flow]: https://docs.google.com/drawings/d/1U_B-_UeWsUsDQUrA_5i8FFLWsYIuJYJTrMfmO3W1cfM/pub?w=647&amp;h=435
[mesa]: http://www.digibarn.com/friends/curbow/star/XDEPaper.pdf
[poodr]: http://www.informit.com/store/practical-object-oriented-design-in-ruby-an-agile-primer-9780321721334

