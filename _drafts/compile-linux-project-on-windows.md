---
layout: post
title: How to compile Linux project on Windows
---

The project I'm currently working on produces deliberables for Windows and Linux platforms. Although the core of the application is a platform-independent Java code, there are still a number of natively compiled libraries. Also, the output of the build differs: executable setup for Windows, and a bunch of DEB and RPM packages for Linux. The build procedure is fully automated with Maven, however building for different platforms requires different toolkits to be installed. 

Running a build procedure to produce Windows installer presents no problem for developers, as our development workstations run under Windows. The situation gets more complicated when Linux build is required, and there is no common approach to that among my teammates. Some developers have their own virtual Linux machines to test local changes, others simply commit changes to the central Git repository and let CI system do its work. Needless to say, neither solution is falwless. What we need is a way to run Linux build procedure on our development workstations as easily as we do it for Windows.

The toolkit to provide the solution exists, though. In this post I'm presenting how I approached this challenge. 
For obvoius reasons, I can't share my company's source code publicly, so I've come up with an example project that simulates the problem. All the ingredients of the solution are still there, though. 

The source code related to this post is available at [GitHub](https://github.com/tindandelion/linux-builder-example). 

# Solution overview

In essence, the solution is quite straightforward:

1. Set up a build environment in a Linux virtual machine.
2. Share the directory with project's source code between this virtual machine
and the Windows host.
3. Log into the build VM and trigger the build.

Current technologies let you do all of the above, but setting up the
build environment from scratch manually is boring and tedious. So my goal was to
create an automated solution that would allow anyone to set up the environment and trigger the build procedure 
with a single command, as soon as they have all necessary tools (a minimal set)
installed on their development workstations. 

Here are the tool we'll be using:

1. [VirtualBox][virtual-box] is a free desktop virtualization solution from
Oracle. It's a good substitute for expensive VMWare Workstation, if you need to set up a
development virtual machine. It also has an extensive API, which allows third parties develop interesting automation solutions.  
2. [Vagrant][vagrant] is one of such tools tool that raises the use of VirtualBox to
the new level. With a single configuraion file, you can fully automate the
process of creating, starting and provisioning your virtual machine from the scratch.
3. [Docker][docker] is a new "golden child" in software deployment. Based on Linux
container technologies, it is a solution that lets you package your application along with its execution environment into a single *image* and then deploy and run it on multiple platforms in its own isolated environment. 
4. [Gradle][gradle] is an automation tool, superseding (hopefully) Maven for building Java projects. Thanks to its plugin architecture and the language it's written in (Groovy), it can be applied to automate nearly any task, not only building the source code. 

# Host environment setup

While I want the build workflow to be fully automated, there are still some
manual setup steps to perform before we can start working. Fortunately, all of
them are abolutely trivial. I assume that, as Java developer, you already have Java
runtime and Gradle installed on your Windows machine, so all we need to do is
the following:

1. Download and install VirtualBox and Vagrant. They both have executable
installers, so the process should be straightforward.
2. Make sure Vagrant is in your `PATH` enviroment, so you can run `vagrant`
command from anywhere in your file system.

# Meet Vagrant

As I mentioned earlier, Vagrant is an automation tool that runs on top of
VirtualBox. Strictly speaking, Vagrant supports multiple virtualization
platforms through plugins, for the desktop (like VMWare Workstation) and for the
cloud (like DigitalOcean). Out of the box Vagrant supports only VirtualBox,
which is quite enough for most development tasks.

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


# Docker for building

# One script to rule them all


[virtual-box]: https://www.virtualbox.org
[vagrant]: https://www.vagrantup.com
[docker]: https://www.docker.com
[gradle]: https://gradle.org


