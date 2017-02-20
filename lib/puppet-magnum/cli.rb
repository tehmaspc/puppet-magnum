require 'thor'
require_relative './defaults'

module PuppetMagnum
  class Cli < Thor

    desc 'module', 'Module related tasks. Type \'puppet-magnum module\' for more help.'
    subcommand 'module', Module

    desc 'version', 'Display version information.'
    def version
      puts "puppet-magnum (#{PuppetMagnum::VERSION})"
    end

  end
end
