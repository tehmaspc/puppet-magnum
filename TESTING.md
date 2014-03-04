# Testing w/ a Magnum Managed Puppet Module

Magnum provides the following Puppet testing tools to allow the Puppet module developer a means to test their Puppet code. The tools provided are [puppet-lint](http://puppet-lint.com/), [rspec-puppet](http://rspec-puppet.com/), [serverspec](http://serverspec.org/), and [vagrant](http://vagrantup.com). 

The following will describe what each tool provided does and how it can be used within a Magnum managed Puppet module.

## puppet-lint

[puppet-lint](http://puppet-lint.com/) allows the Puppet module developer to statically check that the content of their Puppet code conforms to the Puppet style standard. It checks for trailing whitespace, indentation and tabs, and many other Puppet style guidelines as listed [here](http://puppet-lint.com/checks/). With puppet-lint checking for unconformity, it's a lot easier for a team of Puppet developers to adhere to a general style guideline.

Magnum sets up the puppet-lint tool in the Puppet module directory and provides the Rake task 'lint' to run puppet-lint against your code, as shown: 

    % bundle exec rake lint
      manifests/client.pp - WARNING: class not documented on line 1
      manifests/crowsnest.pp - WARNING: class not documented on line 1
      manifests/params.pp - WARNING: top-scope variable being used without an explicit namespace on line 3
      manifests/params.pp - WARNING: class not documented on line 1
      manifests/params.pp - ERROR: trailing whitespace found on line 21
      ...

The developer should check for puppet-lint warnings and errors and fix their code to conform to the style guidelines. Errors should definitely be fixed as they will cause further tests to fail.

If the developer runs the 'lint' task and there is no output - then all the puppet-lint checks passed successfully.

For more details about puppet-lint, please check the [project website](http://puppet-lint.com/).

## rspec-puppet

[rspec-puppet](http://rspec-puppet.com/) allows the Puppet module developer to write [RSpec](https://relishapp.com/rspec) unit tests for their Puppet code.

Each Magnum managed Puppet module directory will have a subdirectory called 'spec' with a directory tree as follows:

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

In order to add additional module dependencies into your Puppet module, Magnum provides a .fixtures.yml file which can be modified to add additional Puppet modules to your project. The default .fixtures.yml file will look like the following:

    fixtures:
    # repositories:
    #   stdlib: 'git://github.com/puppetlabs/puppetlabs-stdlib'
      symlinks:
        ntp/files: '../../../../files'
        ntp/manifests: '../../../../manifests'
        ntp/templates: '../../../../templates'

As you can see, additional modules - like 'stdlib' - can be added to your Puppet module project directory.

### Running rspec-puppet tests

    % bundle exec rake unit
    HEAD is now at 44c181e Merge branch 'fix/master/add_recursive_merge'
    /Users/uchaute/.rvm/rubies/ruby-1.9.3-p448/bin/ruby -S rspec spec/classes/config_spec.rb spec/classes/install_spec.rb spec/classes/ntp_spec.rb spec/classes/service_spec.rb --color
    ........
    
    Finished in 0.53874 seconds
    8 examples, 0 failures

For more details about rspec-puppet and how to write the actual rspec-puppet tests, please check the [project website](http://rspec-puppet.com/).

## serverspec

[serverspec](http://serverspec.org/) allows the Puppet module developer to write [RSpec](https://relishapp.com/rspec) integration tests for their Puppet code. serverspec integration tests work in conjunction with [vagrant](http://www.vagrantup.com/) and allow a Puppet developer the ability to quickly provision a vagrant virtual box Linux system and then run these tests against this live system. 

Each Magnum managed Puppet module directory will have a subdirectory called 'serverspec' with a directory tree as follows:

    serverspec
    ├── serverspec/spec
    │   └── serverspec/spec/MODULE_spec.rb
    └── serverspec/spec_helper.rb

All serverspec tests should be written in the 'serverspec/spec/MODULE_spec.rb' file.

### Running serverspec tests

    % bundle exec rake integ
    HEAD is now at 44c181e Merge branch 'fix/master/add_recursive_merge'
    
    Running integration tests on Vagrant image; this will take a few moments...
    
    /Users/uchaute/.rvm/rubies/ruby-1.9.3-p448/bin/ruby -S rspec serverspec/spec/ntp_spec.rb --color
    ................
    
    Finished in 48.7 seconds
    16 examples, 0 failures

For more details about serverspec and how to write the actual serverspec tests, please check the [project website](http://serverspec.org/).

## vagrant

For more details about vagrant, please check the [project website](http://www.vagrantup.com/).

## Examples of Puppet Modules w/ testing

* [glusterfs](https://devops-tools.pearson.com/stash/projects/OCPSPUPPET/repos/glusterfs/browse)
* [ntp](https://devops-tools.pearson.com/stash/projects/OCPSPUPPET/repos/ntp/browse)
