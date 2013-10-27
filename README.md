# Magnum

Magnum - a tool for rapid, consistent, and best practice [Puppet](http://puppetlabs.com) module development.

Magnum is essentially a Puppet module project generator and a wrapper  
around tools such as: [puppetlabs_spec_helper](http://github.com/puppetlabs/puppetlabs_spec_helper), [rspec-puppet](http://rspec-puppet.com/), [serverspec](http://serverspec.org/), [puppet-lint](http://puppet-lint.com/), [puppet-git-hooks](http://github.com/gini/puppet-git-hooks), [vagrant](http://vagrantup.com), and more!

## Requirements

Magnum is a Ruby gem and thus requires a working Ruby environment on your development machine.  
It's recommended to use [rvm](http://rvm.io) or [rbenv](http://github.com/sstephenson/rbenv) to install and manage the
Ruby versions on your machine.

Currently, using Ruby 1.9.3 latest and above should work fine with Magnum.  
Additionally, ensure that [bundler](http://bundler.io/) (a Ruby gem manager) is installed and available in your gem path.

## Installation

Install Magnum for yourself by doing the following inside a copy of this repo:

    $ bundle install && bundle exec rake install

A termcast is available here and depicts setting up a VirtualBox development environment for Magnum:
[showterm.io/ee21d6c55e3eca7e8dc0d](http://showterm.io/ee21d6c55e3eca7e8dc0d)

## Usage

    % magnum --help
    Commands:
      magnum help [COMMAND]  # Describe available commands or one specific command
      magnum module          # Module related tasks. Type 'magnum module' for more help.
      magnum version         # Display version and copyright information

## Example

The following shows how one can get started quickly creating an 'nginx' Puppet module:

    % magnum module create nginx
          create  nginx/files
          create  nginx/manifests
          create  nginx/templates
          create  nginx/spec
          create  nginx/serverspec/spec
          create  nginx/.vagrant_puppet
          create  nginx/README.md
          create  nginx/LICENSE
          create  nginx/ModuleFile
          create  nginx/manifests/init.pp
          create  nginx/spec/classes
          create  nginx/spec/defines
          create  nginx/spec/functions
          create  nginx/spec/hosts
          create  nginx/spec/unit
          create  nginx/spec/fixtures/modules
          create  nginx/spec/fixtures/modules/.gitkeep
          create  nginx/spec/fixtures/manifests
          create  nginx/spec/fixtures/manifests/site.pp
          create  nginx/spec/spec_helper.rb
          create  nginx/spec/classes/nginx_spec.rb
          create  nginx/serverspec/spec_helper.rb
          create  nginx/serverspec/spec/nginx_spec.rb
          create  nginx/.fixtures.yml
          remove  nginx/Gemfile
          create  nginx/Gemfile
          remove  nginx/Rakefile
          create  nginx/Rakefile
          create  nginx/Vagrantfile
          create  nginx/.vagrant_puppet/init.pp
          remove  nginx/.gitignore
          create  nginx/.gitignore
             run  git init from "./nginx"
             run  git add -A from "./nginx"
          create  nginx/.git/hooks/pre-commit
           chmod  nginx/.git/hooks/pre-commit

## Credits

Standing on the shoulder's of giants - thanks to the following projects for inspiration!:

* [Thor](http://whatisthor.com/)
* [Berkshelf](http://berkshelf.com/)
* [Jackchop](http://rubygems.org/gems/jackchop)

## Authors and License

* Author:: Tehmasp Chaudhri (<tehmasp@gmail.com>, <tehmasp.chaudhri@pearson.com>)

Copyright 2013 Tehmasp Chaudhri

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
