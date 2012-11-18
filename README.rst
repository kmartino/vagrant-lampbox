===============
vagrant-lampbox
===============

A Vagrant and Puppet provisioned, multi-vm lamp stack. A work in progress.

Installation
============

To install manually checkout and run::

    $ vagrant up

Usage
=====

To log into each VM, after starting run:

    $ vagrant ssh client
    $ vagrant ssh service

And visit each VM's home page:

* http://33.33.33.10/
* http://33.33.33.11/

TODO
====

* Deploy each VM with different web sites
* Install Wordpress into the client instance
* Create a third VM called data
* Create a fourth and fifth VM to represent additional serivce instances.
