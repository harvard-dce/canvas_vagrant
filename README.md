Canvas LMS Vagrant Box
======================

Requirements
------------

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com), version >= 1.5.0

Quickstart
----------

    git clone http://github.com/djcp/canvas_vagrant
    cd canvas_vagrant
    vagrant up
    vagrant ssh

Stuff will happen, including downloading a large-ish ubuntu 14.04 VM including
a modern ruby dev environment.

You should see instructions in the vagrant SSH session telling you how to spin
up the canvas LMS and how to access it in your virtualbox host.

If you're happy configuring your vagrant box from scratch, you could:

    mkdir canvas_vagrant && cd canvas_vagrant
    vagrant init harvard-dce/ubuntu-14-04-canvas-lms
    vagrant up
    vagrant ssh

but you'd be missing the port forwarding and VM tuning included in this repo.

VM config overview
------------------

`postgres` is configured to use ident auth. You can access the development
databases within the vagrant box thusly:

    psql canvas_development

Redis is installed, but caching is not enabled because this is meant to be
a development image. See [this part of the
quickstart](https://github.com/instructure/canvas-lms/wiki/Quick-Start#performance-tweaks)
if you'd like to introduce class, template, and rails caching. Keep in mind
that you'll need to restart after every code change if you go this route.

We use `foreman` to spin up canvas with all its attached services. This is
documented in the `motd` you get when `vagrant ssh`ing.

`rbenv` is used to manage rubies.

Coming Soon?
============

* Provisioning via [ansible](http://ansible.com)
* Multiple providers
* Automated repackaging based on new canvas releases

See also
========

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com)
* [laptop](http://github.com/thoughtbot/laptop)
* [canvas](http://github.com/instructure/canvas-lms)

Copyright
=========

Copyright (c) President and Fellows of Harvard College, 2014
