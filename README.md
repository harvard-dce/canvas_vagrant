Canvas LMS Vagrant Box
======================

Installs a recent bootstrapped canvas via vagrant and virtualbox.

Requirements
------------

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com), version >= 1.5.0

Quickstart
----------

    git clone http://github.com/djcp/canvas_vagrant
    cd canvas_vagrant
    vagrant box update # Only if you've used this before
    vagrant up # Time passes. . .
    vagrant ssh

Vagrant box overview
------------------

The vagrant box includes:

* A 2gb RAM allocation (canvas requires this much RAM to run acceptably),
* A recent-ish canvas as of the time the base box was created, from the `master` branch,
* A migrated and seeded database,
* Rendered assets,
* Canvas is exported on http://192.168.50.4:3000/ (after you've started it),
* A `Procfile.dev` to make starting canvas easier.

You should see specific instructions in the vagrant SSH session telling you
how to spin up the canvas LMS and how to access it in your virtualbox host.

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

Notes
-----

You should run `vagrant box list` and remove any old versions of the box this
provides when you're done with them, otherwise they could take up a significant
amount of disk space.

See also
========

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com)
* [canvas](http://github.com/instructure/canvas-lms)

Copyright
=========

Copyright (c) President and Fellows of Harvard College, 2014
