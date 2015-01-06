# Canvas LMS Vagrant Box

Installs a recent bootstrapped canvas via vagrant and virtualbox, optimized for
LTI tool development.

## Requirements

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com), version >= 1.5.0

## Quickstart

    $ git clone http://github.com/harvard-dce/canvas_vagrant
    $ cd canvas_vagrant
    $ vagrant up # Time passes. . .
    $ vagrant ssh
    vagrant@vagrant:~$ cd canvas-lms
    vagrant@vagrant:~/canvas-lms$ foreman start -f Procfile.dev 

You'll be able to access a recent canvas install at http://192.168.50.4:3000/
after the web server is started completely in about 30 seconds.

When you're done, you can exit the server with `<ctrl-c>`.

    vagrant@vagrant:~/canvas-lms$ exit
    $ vagrant halt # Free RAM and CPU by shutting down the box, or remove entirely via 'vagrant destroy'

If you've used this project before and want to update your box, see
[Updating](#updating) below.

## Vagrant box overview

The vagrant box includes:

* A 2gb RAM allocation (canvas requires this much RAM to run acceptably),
* A recent-ish canvas as of the time the base box was created, from the
  `master` branch,
* A migrated and seeded database,
* Rendered assets,
* Canvas is exported on http://192.168.50.4:3000/ (after you've started it),
* A `Procfile.dev` to make starting canvas easier.

You should see specific instructions in the vagrant SSH session telling you
how to spin up the canvas LMS and how to access it in your virtualbox host.

`postgres` is configured to use ident auth. You can access the development
databases within the vagrant box thusly:

    vagrant@vagrant:~$ psql canvas_development

Redis is installed, but caching is not enabled by default. See [this part of the
quickstart](https://github.com/instructure/canvas-lms/wiki/Quick-Start#performance-tweaks)
if you'd like to introduce class, template, and rails caching. Keep in mind
that you'll need to restart after every code change if you go this route.

We use [foreman](https://github.com/ddollar/foreman) to spin up canvas with all
its attached services. This is documented in the `motd` you get when `vagrant
ssh`ing.

[rbenv](https://github.com/sstephenson/rbenv) is used to manage rubies, with
[ruby-build](https://github.com/sstephenson/ruby-build) handling installations.

## Updating

If you've used this project before and want to update to the latest canvas box,
you should:

* Update the git repository: `cd canvas_vagrant && git pull`
* Remove your previous box (after you've backed up or copied whatever is
  important out of it, which may be nothing): `vagrant destroy`
* Update to the latest box: `vagrant box update`
* Launch!: `vagrant up`
* Remove the old box version to clear up disk space: `vagrant box remove
  harvard-dce/ubuntu-14-04-canvas-lms --box-version=<the old version>`

## See also

* [virtualbox](http://virtualbox.org)
* [vagrant](http://vagrantup.com)
* [canvas](http://github.com/instructure/canvas-lms)

## The future

* Use passenger-standalone for the web server
* Create a self-signed SSL cert and host canvas on HTTPS and HTTP
* Better seed data

## Contributors

* Dan Collis-Puro - [djcp](http://github.com/djcp)

## Copyright

Copyright (c) President and Fellows of Harvard College, 2014
