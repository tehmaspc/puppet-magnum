# Magnum

Magnum - a tool for rapid, consistent, and best practice Puppet module development.

Magnum is a wrapper around [Puppet](http://puppetlabs.com/), [rspec-puppet](http://rspec-puppet.com/),
[serverspec](http://serverspec.org/), [puppet-lint](http://puppet-lint.com/), and other Puppet testing tools.

## Installation

Install Magnum for yourself by doing the following inside a copy of this repo:

    $ bundle install && bundle exec rake install

NOTE: Install a recent version of Ruby (e.g. 1.9.3) and make sure [bundler](http://bundler.io/) is installed.

## Usage

    % magnum --help
    Commands:
      magnum help [COMMAND]  # Describe available commands or one specific command
      magnum module          # Module related tasks. Type 'magnum module' for more help.

## Example

The following shows how one can get started quickly creating an 'nginx' Puppet module:

    % magnum module create nginx
          create  nginx/files
          create  nginx/manifests
          create  nginx/templates
          create  nginx/spec
          create  nginx/serverspec/spec
          create  nginx/README.md
          create  nginx/LICENSE
          create  nginx/Gemfile
          create  nginx/Rakefile
          create  nginx/ModuleFile
          create  nginx/manifests/init.pp

      NOTE: Installing Vagrantfile with 'default' box.

          create  nginx/Vagrantfile
             run  rspec-puppet-init &>/dev/null from "./nginx"
          remove  nginx/spec/spec_helper.rb
          create  nginx/spec/spec_helper.rb
          create  nginx/spec/classes/nginx_spec.rb
          create  nginx/serverspec/spec_helper.rb
          create  nginx/serverspec/spec/nginx_spec.rb
          create  nginx/.gitignore
             run  git init from "./nginx"
             run  git add -A from "./nginx"
             run  git commit -m 'Initial commit. Puppet module created by Magnum' from "./nginx"

      NOTE: Remember to setup a git repo and a remote to push your changes to.

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
