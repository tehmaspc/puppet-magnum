require 'thor'
require_relative './version'

module Magnum
  class Cli < Thor

    desc 'module', 'Module related tasks. Type \'magnum module\' for more help.'
    subcommand 'module', Module

    desc 'version', 'Display version and copyright information'
    def version
      puts "#{version_header}\n#{license}"
    end

    private

      def version_header
        "Magnum (#{Magnum::VERSION.chomp})"
      end

      def license
        File.read(Magnum.root.join('LICENSE'))
      end

  end
end
