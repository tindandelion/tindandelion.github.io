---
layout: post
title: How to compile Linux project on Windows
---

The project I'm currently working on produces deliverables for Windows and Linux
platforms. Although the core of the application is a platform-independent Java
code, there are still a number of natively compiled libraries. Also, the output
of the build differs: executable setup for Windows, and a bunch of DEB and RPM
packages for Linux. The build procedure is fully automated with Maven, however
building for different platforms requires different toolkits to be installed.

Running a build procedure to produce Windows installer presents no problem for
developers, as our development workstations run under Windows. The situation
gets more complicated when Linux build is required, and there is no common
approach to that among my teammates. Some developers have their own virtual
Linux machines to test local changes, others simply commit changes to the
central Git repository and let CI system do its work. Needless to say, neither
solution is falwless. What we need is a way to run Linux build procedure on our
development workstations as easily as we do it for Windows.

The toolkit to provide the solution exists, though. In this post I'm presenting
how I approached this challenge.  For obvoius reasons, I can't share my
company's source code publicly, so I've come up with an example project that
simulates the problem. All the ingredients of the solution are still there,
though.

The source code related to this post is available at
[GitHub](https://github.com/tindandelion/linux-builder-example).

# Solution overview

In essence, the solution is quite straightforward:

1. Set up a build environment in a Linux virtual machine.
2. Share the directory with project's source code between this virtual machine
and the Windows host.
3. Log into the build VM and trigger the build.

Current technologies let you do all of the above, but setting up the build
environment from scratch manually is boring and tedious. So my goal was to
create an automated solution that would allow anyone to set up the environment
and trigger the build procedure with a single command, as soon as they have all
necessary tools (a minimal set) installed on their development workstations.

Here are the tools we'll be using:

1. [VirtualBox][] to run our virtual Linux build box;
2. [Vagrant][] to create, provision and control our virtual machine;
3. [Docker][] to provide a compilation environment;
4. [Gradle][] to orchestrate the whole build process.

# Host environment setup

While I want the build workflow to be fully automated, there are still some
manual setup steps to perform before we can start working. Fortunately, all of
them are abolutely trivial. I assume that, as Java developer, you already have
[Java runtime][jre] and [Gradle][] installed on your Windows machine, so all we
need to do is the following:

1. Download and install [VirtualBox][] and [Vagrant][]. They both have executable
installers, so the process should be straightforward.
2. Make sure Vagrant is in your `PATH` enviroment, so you can run `vagrant`
command from anywhere in your file system. The installer should do that for you,
but it's worth checking before we continue.

# Meet Vagrant

As I mentioned earlier, Vagrant is an automation tool that runs on top of
VirtualBox. Strictly speaking, Vagrant supports multiple virtualization provider
through plugins, for the desktop (like VMWare Workstation) and for the cloud
(like DigitalOcean). Out of the box Vagrant supports only VirtualBox, which is
quite enough for most development tasks.

Vagrant works from the command line, and all commands follow the following
pattern:

    vagrant [options] <command> [<args>]

For instance, `vagrant help` is a good place to start from. Another useful
starting command is `vagrant init`, which will create a skeletal `Vagrantfile`
in the current directory. This generated file is extensively commented and
provide a lot of information about what confiuration options are available.

For our purposes, I prepared a `Vagrantfile` by stripping off unnecessary
details from the initial auto-generated template. Let's go through it and
discuss what these configuration options mean.

{% highlight ruby linenos %}
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "brave-hello", "/workspace"
 
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant/builder", args: "-t builder"
  end
end
{% endhighlight %}

The first thing you may notice is the syntax. Vagrant is written in Ruby and, as
many Ruby applications, its configuration file is a Ruby script. That's worth
knowing if you encounter a strange syntax construct: use
[Ruby documentation][ruby] for explanation. But don't fret, `Vagrantfile` is
pretty straightforward.

*Line 2* specifies what box we are going to use as a template for our virtual
machine. A box, in Vagrant's terminology, is a virtual machine image along with
some additional metadata. Vagrant's creators support a
[public Vagrant box catalog](https://atlas.hashicorp.com/boxes/search) with a
lot of preconfigured boxes. The `config.vm.box` setting we provide is the name
of the box in this catalog. In our case, we are going to use an official Ubuntu
14.04 box.

*Line 4* is commented, but I left it here to demonstrate how one can configure
the port forwarding from the host machine to the guest.

*Line 5* adds a shared folder to the virtual machine. Vagrant will use
VirtualBox's shared folder capabilities to map our project's source directory
(`brave-hello`) to the guest file system at `/workspace`. This mapping will let
me access the project's source code from inside the guest as if it was the local
directory in the guest's file system.

By default, Vagrant will map its working directory to `/vagrant` directory in
the guest. Thus, my custom mapping to `/workspace` isn't really necessary, but I
decided to leave it for convenience. 

*Lines 7-9* are very interesting. There I specify how I want to provision my
virtual machine. Vagrant supports multiple provisioners: simple shell scripts,
Puppet, Chef, etc. In our case, I use
[Docker provisioner](http://docs.vagrantup.com/v2/provisioning/docker.html). This
provisioner can pull images from Docker registry and run containers inside the
guest. But in our case I want it to build the image from a `Dockerfile`
(discussed later). Notice that I make use of `/vagrant` shared folder mapping
here. I also give the image a tag `builder` to refer to it later, when I run
containers from this image.

At this point, I'm ready to start my virtual machine. But before, let's take a
look into the `Dockerfile` I use to build the Docker image.

# Docker for building



# One script to rule them all


[VirtualBox]: https://www.virtualbox.org
[Vagrant]: https://www.vagrantup.com
[Docker]: https://www.docker.com
[Gradle]: https://gradle.org
[jre]: http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html
[ruby]: https://www.ruby-lang.org/
