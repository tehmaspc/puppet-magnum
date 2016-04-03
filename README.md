# puppet-magnum

[![Build Status](https://travis-ci.org/tehmaspc/puppet-magnum.svg?branch=master)](https://travis-ci.org/tehmaspc/puppet-magnum)

`puppet-magnum` is a tool for rapid, consistent, and best practice Puppet module development.

`puppet-magnum` helps the Puppet module developer to create or maintain a Puppet module and test the module with tools like the following:

* [puppet-lint](http://puppet-lint.com)
* [rspec-puppet](http://rspec-puppet.com)
* [puppetlabs_spec_helper](http://github.com/puppetlabs/puppetlabs_spec_helper)
* [serverspec](http://serverspec.org) (via `vagrant-serverspec`)

## Installation

* Install Ruby 2.3.0+
* `gem install puppet-magnum`

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
          ...
          create  nginx/Vagrantfile
          create  nginx/.vagrant_puppet/init.sh
          create  nginx/.vagrant_puppet/environments/vagrant/environment.conf
          create  nginx/.vagrant_puppet/environments/vagrant/manifests/init.pp
          remove  nginx/.puppet-magnum.init
          create  nginx/.puppet-magnum.init
          remove  nginx/.gitignore
          create  nginx/.gitignore
             run  git init from "./nginx"
             run  git add -A from "./nginx"

## Parameters

`puppet-magnum` can take several parameters which will be used for populating the templates of things like manifest documentation, licensing and maintainer information.

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

## Documentation

* [puppet-magnum Wiki](https://github.com/tehmaspc/puppet-magnum/wiki)

## Credits

Thanks to the following projects for inspiration!:

* [Thor](http://whatisthor.com/)
* [Berkshelf](http://berkshelf.com/)

## Authors and License

Copyright 2013-2016 Tehmasp Chaudhri <tehmasp@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
