# Magnum

Magnum - a tool for rapid, consistent, and best practice Puppet module development.

Magnum is a wrapper around [Puppet](http://puppetlabs.com/), [rspec-puppet](http://rspec-puppet.com/),
[serverspec](http://serverspec.org/), [puppet-lint](http://puppet-lint.com/), and other Puppet testing tools.

## Installation

Install Magnum for yourself by doing the following inside a copy of this repo:

    $ bundle install && bundle exec rake install

## Usage

    % magnum --help
    Commands:
      magnum help [COMMAND]  # Describe available commands or one specific command
      magnum module          # Module related tasks. Type 'magnum module' for more help.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Standing on the shoulder's of giants - thanks to the following projects for inspiration!:

[Thor](http://whatisthor.com/)
[Berkshelf](http://berkshelf.com/)
[Jackchop](http://rubygems.org/gems/jackchop)
