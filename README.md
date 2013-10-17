# Magnum

Magnum - a tool for rapid, consistent, and best practice Puppet module development.

Magnum is a wrapper around [Puppet](http://puppetlabs.com/), [rspec-puppet](http://rspec-puppet.com/),
[serverspec](http://serverspec.org/), [puppet-lint](http://puppet-lint.com/), and other Puppet testing tools.

## Requirements

Magnum is a Ruby gem and thus requires a working Ruby environment on your development machine.  
It's recommended to use [RVM](http://rvm.io) or [Rbenv](http://github.com/sstephenson/rbenv) to install and manage the
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
          create  nginx/vagrant
          create  nginx/README.md
          create  nginx/LICENSE
          create  nginx/ModuleFile
          create  nginx/manifests/init.pp
          remove  nginx/Rakefile
             run  rspec-puppet-init &>/dev/null from "./nginx"
          remove  nginx/spec/spec_helper.rb
          create  nginx/spec/spec_helper.rb
          create  nginx/spec/classes/nginx_spec.rb
          create  nginx/serverspec/spec_helper.rb
          create  nginx/serverspec/spec/nginx_spec.rb
          create  nginx/Gemfile
          remove  nginx/Rakefile
          create  nginx/Rakefile
          create  nginx/Vagrantfile
          create  nginx/vagrant/vagrant.pp
          create  nginx/.gitignore
             run  git init from "./nginx"
             run  git add -A from "./nginx"
          create  nginx/.git/hooks/pre-commit
           chmod  nginx/.git/hooks/pre-commit

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

* Tehmasp Chaudhri (tehmasp@gmail.com, tehmasp.chaudhri@pearson.com)

## Thanks

Standing on the shoulder's of giants - thanks to the following projects for inspiration!:

* [Thor](http://whatisthor.com/)
* [Berkshelf](http://berkshelf.com/)
* [Jackchop](http://rubygems.org/gems/jackchop)
