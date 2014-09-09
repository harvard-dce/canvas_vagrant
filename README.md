Canvas LMS Vagrant Box
======================

Requirements
------------

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com), version >= 1.5.0

Quickstart
----------

```bash
> git clone http://github.com/djcp/canvas_vagrant
> cd canvas_vagrant
> vagrant up
> vagrant ssh

```

Stuff will happen, including downloading a large-ish ubuntu 14.04 VM including
a modern ruby dev environment provided by the [thoughtbot laptop
script](http://github.com/thoughtbot/laptop).

You should see instructions in the vagrant SSH session telling you how to spin
up the canvas LMS and how to access it in your virtualbox host.

If you're happy configuring everything about your vagrant box from scratch, you
could:

```bash
> mkdir canvas_vagrant && cd canvas_vagrant
> vagrant init harvard-dce/canvas
> vagrant up
> vagrant ssh
```

but you'd be missing the port forwarding and VM tuning included in this repo.

Coming Soon?
============

* Provisioning via [ansible](http://ansible.com)
* Multiple providers

See also
========

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com)
* [laptop](http://github.com/thoughtbot/laptop)
* [canvas](http://github.com/instructure/canvas-lms)

Copyright
=========

Copyright (c) President and Fellows of Harvard College, 2014
