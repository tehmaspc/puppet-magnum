require 'thor'
require_relative './version'

module Magnum
  class Cli < Thor

    desc 'module', 'Module related tasks. Type \'magnum module\' for more help.'
    subcommand 'module', Module

    desc 'version', 'Display version information.'
    def version
      puts "Magnum (#{Magnum::VERSION.chomp})"
    end

  end
end
