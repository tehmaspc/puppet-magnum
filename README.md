# Magnum

Magnum - Pearson's tool for Puppet module development.

Magnum is Pearson's wrapper around [Puppet](http://puppetlabs.com/), [rspec-puppet](http://rspec-puppet.com/),
[serverspec](http://serverspec.org/), [puppet-lint](http://puppet-lint.com/), and other Puppet testing tools.

The intention of Magnum is to ensure that we are creating and testing our Puppet modules in a consistent manner.

## Installation

Add this line to your application's Gemfile:

    gem 'magnum'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install magnum

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
