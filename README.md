# puppet-magnum

[![Build Status](https://travis-ci.org/tehmaspc/puppet-magnum.svg?branch=master)](https://travis-ci.org/tehmaspc/puppet-magnum)

puppet-magnum - a tool for rapid, consistent, and best practice [Puppet](http://puppetlabs.com) module development.

puppet-magnum is essentially a Puppet module project generator and a wrapper
around tools such as: [puppetlabs_spec_helper](http://github.com/puppetlabs/puppetlabs_spec_helper), [rspec-puppet](http://rspec-puppet.com/), [puppet-lint](http://puppet-lint.com/), [vagrant-serverspec](https://github.com/jvoorhis/vagrant-serverspec), [vagrant](http://vagrantup.com), and more!

## Requirements

puppet-magnum is a Ruby gem and thus requires a working Ruby environment on your development machine.
It's recommended to use [rbenv](http://github.com/sstephenson/rbenv) to install and manage the Ruby versions on your machine.

Currently, using Ruby 2.3.0 latest and above should work fine with puppet-magnum.
Additionally, ensure that [bundler](http://bundler.io/) (a Ruby gem manager) is installed and available in your gem path.

## Installation

Install puppet-magnum for yourself by doing the following inside a copy of this repo:

    % bundle install && rake install

## Usage

    % puppet-magnum --help
    Commands:
      puppet-magnum help [COMMAND]  # Describe available commands or one specific command
      puppet-magnum module          # Module related tasks. Type 'puppet-magnum module' for more help.
      puppet-magnum version         # Display version and copyright information

## Example Creating An 'nginx' Puppet Module

The following shows how one can get started quickly creating an 'nginx' Puppet module:

    % puppet-magnum module create nginx
          create  nginx/manifests
          create  nginx/templates
          create  nginx/files
          create  nginx/spec
          create  nginx/serverspec
          create  nginx/.vagrant_puppet
          create  nginx/README.md
          create  nginx/LICENSE
          create  nginx/metadata.json
          create  nginx/manifests/init.pp
          create  nginx/spec/classes
          create  nginx/spec/defines
          create  nginx/spec/functions
          create  nginx/spec/hosts
          create  nginx/spec/unit
          create  nginx/spec/fixtures/manifests
          create  nginx/spec/fixtures/manifests/site.pp
          create  nginx/spec/fixtures/modules/nginx
          remove  nginx/spec/fixtures/modules/nginx/manifests
          create  nginx/spec/fixtures/modules/nginx/manifests
          remove  nginx/spec/fixtures/modules/nginx/templates
          create  nginx/spec/fixtures/modules/nginx/templates
          remove  nginx/spec/fixtures/modules/nginx/files
          create  nginx/spec/fixtures/modules/nginx/files
          create  nginx/spec/spec_helper.rb
          create  nginx/spec/classes/nginx_spec.rb
          create  nginx/.rspec
          create  nginx/serverspec/nginx_spec.rb
          create  nginx/.fixtures.yml
          remove  nginx/Gemfile
          create  nginx/Gemfile
          remove  nginx/Rakefile
          create  nginx/Rakefile
          create  nginx/Vagrantfile
          create  nginx/.vagrant_puppet/init.sh
          create  nginx/.vagrant_puppet/environments/vagrant/environment.conf
          create  nginx/.vagrant_puppet/environments/vagrant/manifests/init.pp
          remove  nginx/.magnum.init
          create  nginx/.magnum.init
          remove  nginx/.gitignore
          create  nginx/.gitignore
             run  git init from "./nginx"
             run  git add -A from "./nginx"

## Parameters

puppet-magnum can take several parameters which will be used for populating the templates of things like manifest documentation, licensing and maintainer information.

- maintainer: maintainer name of module.
- maintainer_email: maintainer email of module.
- copyright_year: defaults to current year.
- copyright_holder: defaults to maintainer if not declared.

### .magnumrc file
The values above can be set via a file in your home directory called *_.magnumrc_*

```
---
  maintainer: Infrastructure Team
  maintainer_email: infrastructure_team@example.com
  copyright_holder: Example.com LLC
```

## Testing within a puppet-magnum Managed Puppet Module

puppet-magnum provides the following Puppet testing tools to allow the Puppet module developer a means to test their Puppet code. The tools provided are [puppet-lint](http://puppet-lint.com/), [rspec-puppet](http://rspec-puppet.com/), [serverspec](http://serverspec.org/), and [vagrant](http://vagrantup.com).

The following will describe what each tool provided does and how it can be used within a puppet-magnum managed Puppet module.

### puppet-lint

[puppet-lint](http://puppet-lint.com/) allows the Puppet module developer to statically check that the content of their Puppet code conforms to the Puppet style standard. It checks for trailing whitespace, indentation and tabs, and many other Puppet style guidelines as listed [here](http://puppet-lint.com/checks/). With puppet-lint checking for unconformity, it's a lot easier for a team of Puppet developers to adhere to a general style guideline.

puppet-magnum sets up the puppet-lint tool in the Puppet module directory and provides the Rake task 'lint' to run puppet-lint against your code, as shown:

    % rake lint
      manifests/client.pp - WARNING: class not documented on line 1
      manifests/crowsnest.pp - WARNING: class not documented on line 1
      manifests/params.pp - WARNING: top-scope variable being used without an explicit namespace on line 3
      manifests/params.pp - WARNING: class not documented on line 1
      manifests/params.pp - ERROR: trailing whitespace found on line 21
      ...

The developer should check for puppet-lint warnings and errors and fix their code to conform to the style guidelines. Errors should definitely be fixed as they will cause further tests to fail.

If the developer runs the 'lint' task and there is no output - then all the puppet-lint checks passed successfully.

For more details about puppet-lint, please check the [project website](http://puppet-lint.com/).

### rspec-puppet

[rspec-puppet](http://rspec-puppet.com/) allows the Puppet module developer to write [RSpec](https://relishapp.com/rspec) unit tests for their Puppet code.

Each puppet-magnum managed Puppet module directory will have a subdirectory called 'spec' with a directory tree as follows:

    spec
    ├── spec/classes
    │   └── spec/classes/ntp_spec.rb
    ├── spec/defines
    ├── spec/fixtures
    │   ├── spec/fixtures/manifests
    │   │   └── spec/fixtures/manifests/site.pp
    │   └── spec/fixtures/modules
    │       └── spec/fixtures/modules/ntp
    │           ├── spec/fixtures/modules/ntp/files -> ../../../../files
    │           ├── spec/fixtures/modules/ntp/lib
    │           │   └── spec/fixtures/modules/ntp/lib/puppet
    │           │       └── spec/fixtures/modules/ntp/lib/puppet/parser
    │           │           └── spec/fixtures/modules/ntp/lib/puppet/parser/functions
    │           │               └── spec/fixtures/modules/ntp/lib/puppet/parser/functions/zabbix_registration.rb
    │           ├── spec/fixtures/modules/ntp/manifests -> ../../../../manifests
    │           └── spec/fixtures/modules/ntp/templates -> ../../../../templates
    ├── spec/functions
    ├── spec/hosts
    ├── spec/spec_helper.rb
    └── spec/unit

All rspec-puppet tests for Puppet classes should be written in the 'spec/classes/MODULE_spec.rb' file.

All rspec-puppet tests for Puppet define types should be written in the 'spec/defines/MODULE_spec.rb' file.

As you can see above there are numerous files underneath the 'spec' subdirectory. A lot of these files - especially the files under 'spec/fixtures' - exist to glue together our RSpec testing tools. The 'spec/fixtures' directory is unique in that all module dependencies, including the module being developed, should be found under the 'spec/fixtures' directory. rspec-puppet, serverspec, and vagrant will all make use of this special 'spec/fixtures' directory.

In order to add additional module dependencies into your Puppet module, puppet-magnum provides a .fixtures.yml file which can be modified to add additional Puppet modules to your project. The default .fixtures.yml file will look like the following:

    fixtures:
    # repositories:
    #   stdlib: 'git://github.com/puppetlabs/puppetlabs-stdlib'
      symlinks:
        ntp/files: '../../../../files'
        ntp/manifests: '../../../../manifests'
        ntp/templates: '../../../../templates'

As you can see, additional modules - like 'stdlib' - can be added to your Puppet module project directory.

#### Running rspec-puppet tests

    % rake unit
    HEAD is now at 44c181e Merge branch 'fix/master/add_recursive_merge'
    /usr/local/opt/rbenv/shims/ruby -S rspec spec/classes/config_spec.rb spec/classes/install_spec.rb spec/classes/ntp_spec.rb spec/classes/service_spec.rb --color
    ........

    Finished in 0.53874 seconds
    8 examples, 0 failures

For more details about rspec-puppet and how to write the actual rspec-puppet tests, please check the [project website](http://rspec-puppet.com/).

### serverspec

[serverspec](http://serverspec.org/) allows the Puppet module developer to write [RSpec](https://relishapp.com/rspec) integration tests for their Puppet code. serverspec integration tests work in conjunction with [vagrant](http://www.vagrantup.com/) and allow a Puppet developer the ability to quickly provision a vagrant virtual box Linux system and then run these tests against this live system.

Each puppet-magnum managed Puppet module directory will have a subdirectory called 'serverspec' with a directory tree as follows:

    serverspec
    ├── serverspec/spec
    │   └── serverspec/spec/MODULE_spec.rb
    └── serverspec/spec_helper.rb

All serverspec tests should be written in the 'serverspec/spec/MODULE_spec.rb' file.

#### Running serverspec tests

    % rake integ
    HEAD is now at 44c181e Merge branch 'fix/master/add_recursive_merge'

    Running integration tests on Vagrant image; this will take a few moments...

    /usr/local/opt/rbenv/shims/ruby -S rspec serverspec/spec/ntp_spec.rb --color
    ................

    Finished in 48.7 seconds
    16 examples, 0 failures

For more details about serverspec and how to write the actual serverspec tests, please check the [project website](http://serverspec.org/).

### vagrant

[vagrant](http://vagrantup.com) allows the Puppet developer to start local VirtualBox instances in their Puppet module project and provision the instance with the Puppet module being tested. vagrant requires a Vagrantfile which specifies how to launch a VirtualBox instance. puppet-magnum sets up the required Vagrantfile with the proper configurations required to start the VirtualBox VM (w/ 'vagrant up') and provision the instance with the module being tested.

puppet-magnum also creates a .vagrant_puppet/ directory in your Puppet module project and more importantly a .vagrant_puppet/init.pp file containing the necessary configuration for Puppet provisioning your VirtualBox instance. The Puppet module developer should change the .vagrant_puppet/init.pp file to provision their VirtualBox instance according to their needs. The best way to understand this is to take a look at some of the Puppet module examples below.

During the development of a Puppet module, the Puppet module developer can run 'vagrant provision' to continuously test their Puppet module changes. The developer can login to the VirtualBox instance (w/ 'vagrant ssh') and check the state of their Puppet provisioning.

NOTE: vagrant does NOT implicitly re-provision your VirtualBox instance each time. Only on a new VirtualBox instance creation will VirtualBox automatically run a 'provision' for you. The Puppet module developer should run 'vagrant provision' each time they need to check their latest Puppet code changes.

For more details about vagrant, please check the [project website](http://www.vagrantup.com/).

## Credits

Standing on the shoulder's of giants - thanks to the following projects for inspiration!:

* [Thor](http://whatisthor.com/)
* [Berkshelf](http://berkshelf.com/)

## Authors and License

* Author:: Tehmasp Chaudhri (<tehmasp@gmail.com>)

Copyright 2013-2016 Tehmasp Chaudhri

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
