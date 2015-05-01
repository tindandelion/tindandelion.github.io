---
layout: post
title: How to compile Linux project on Windows
---

At work, I develop a cross-platform Java application. Our build procedure is
fully automated, and can run the entire procedure from

# Solution overview

In itself, the solution is quite straightforward:

1. Set up a build environment in a Linux virtual machine.
2. Share the workspace with project's source code between this virtual machine
and the Windows host.
3. Log into the build VM and runt the build.

Current technologies let you do all of the above easily, but setting up the
build environment from scratch manually is boring and tedious. So my goal was to
create an automated solution that would allow anyone to set up the build
environment with a single command, provided that they have all necessary tools
installed.

1. [VirtualBox][virtual-box] is a free desktop virtualization platform from
Oracle. It's a good substitute for VMWare Workstation, if you need to set up a
development virtual machine. 
2. [Vagrant][vagrant] is a tool that raises the use of VirtualBox to
the new level. With a single configuraion file, you can fully automate the
process of creating, starting and configuring your virtual machine.
3. [Docker][docker] is a new "golden child" in software deployment. Based on Linux
container technologies, it is a solution that lets you package your application
4. [Gradle][gradle] is a build automation tool.

[virtual-box]: https://www.virtualbox.org
[vagrant]: https://www.vagrantup.com
[docker]: https://www.docker.com
[gradle]: https://gradle.org

# Host environment setup

While I want the build workflow to be fully automated, there are still some
manual setup steps to perform before we can start working. Fortunately, all of
them are trivial. I assume that, as Java developer, you already have Java
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



