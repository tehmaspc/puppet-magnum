# puppet-magnum

[![Build Status](https://travis-ci.org/tehmaspc/puppet-magnum.svg?branch=master)](https://travis-ci.org/tehmaspc/puppet-magnum)

**NOTE: `puppet-magnum` 4.x is NOT backwards compatible with `puppet-magnum` 3.x managed repos.  
Re-initializing a `puppet-magnum` 3.x repo with 4.x will update and remove certain files in order to work with 4.x.**

`puppet-magnum` is a tool for rapid, consistent, and best practice Puppet (4+) module development.

`puppet-magnum` helps the Puppet module developer create or maintain a Puppet module and test the module with tools like the following:

* [puppet-lint](http://puppet-lint.com)
* [puppetlabs_spec_helper](http://github.com/puppetlabs/puppetlabs_spec_helper)
* [serverspec](http://serverspec.org) (via [Beaker](https://github.com/puppetlabs/beaker))

## Installation

### Requirements

* Install Ruby 2.4.x.
* Install [Vagrant](https://www.vagrantup.com).
* Install [VirtualBox](https://www.virtualbox.org/wiki/VirtualBox).
* Install [Docker](https://www.docker.com) (optional).

### Install `puppet-magnum`

* `% gem install puppet-magnum`

## Usage

    % puppet-magnum --help
    Commands:
      puppet-magnum help [COMMAND]  # Describe available commands or one specific command
      puppet-magnum module          # Module related tasks. Type 'puppet-magnum module' for more help.
      puppet-magnum version         # Display version and copyright information

## Example: Creating an `nginx` Puppet Module

The following shows how one can get started quickly creating an 'nginx' Puppet module:

    % puppet-magnum module create nginx
          create  nginx/manifests
          create  nginx/data
          create  nginx/templates
          create  nginx/files
          create  nginx/spec
          create  nginx/spec/acceptance
          create  nginx/spec/acceptance/nodesets
          ...
          create  nginx/.puppet-magnum.init
          create  nginx/metadata.json
          create  nginx/manifests/init.pp
          create  nginx/hiera.yaml
          create  nginx/data/common.yaml
          create  nginx/.rspec
          create  nginx/spec/acceptance/nginx_spec.rb
          create  nginx/spec/spec_helper_acceptance.rb
          create  nginx/spec/acceptance/nodesets/ubuntu-server-1404-x64.yml
          create  nginx/spec/acceptance/nodesets/ubuntu-server-1604-x64.yml
          remove  nginx/.gitignore
          create  nginx/.gitignore
             run  git init from "./nginx"
             run  git add -A from "./nginx"

## `.magnumrc` File
The following values can be set via a file in your *home* directory called `.magnumrc`

```
---
  maintainer: Infrastructure Team
  maintainer_email: infrastructure_team@example.com
  copyright_holder: Example.com LLC
```

## Documentation

* [puppet-magnum Wiki](https://github.com/tehmaspc/puppet-magnum/wiki)

## Credits

Thanks to the following projects and folks!:

* [Thor](http://whatisthor.com/)
* [Berkshelf](http://berkshelf.com/)
* [Contributors](https://github.com/tehmaspc/puppet-magnum/graphs/contributors), including [@sepulworld](https://github.com/sepulworld)

## Authors and License

Copyright 2013-2017 Tehmasp Chaudhri <tehmasp@chaudhri.me>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
