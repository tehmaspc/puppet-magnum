# Testing w/ a Magnum Managed Puppet Module

Magnum provides the following Puppet testing tools to allow the Puppet module developer a means to test their Puppet code. The tools provided are [puppet-lint](http://puppet-lint.com/), [rspec-puppet](http://rspec-puppet.com/), [serverspec](http://serverspec.org/), and [vagrant](http://vagrantup.com). 

The following will describe what each tool provided does and how it can be used within a Magnum managed Puppet module.

## puppet-lint

[puppet-lint](http://puppet-lint.com/) allows the Puppet module developer to statically check that the content of their Puppet code conforms to the Puppet style standard. It checks for whitespace, indentation and tabs, and general Puppet style guidelines as listed [here](http://puppet-lint.com/checks/). With puppet-lint checking for unconformity because a lot easier and allows a team of Puppet developers to adhere to a general style guideline.

Magnum sets up the puppet-lint tool into your Puppet module directory and provides the Rake task 'lint' to run puppet-lint against your code, as shown: 

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

## 

## rspec-puppet

For more details about rspec-puppet, please check the [project website](http://rspec-puppet.com/).

## serverspec

For more details about puppet-lint, please check the [project website](http://serverspec.org/).

## vagrant

For more details about puppet-lint, please check the [project website](http://www.vagrantup.com/).
