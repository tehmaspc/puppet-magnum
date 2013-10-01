require 'thor'

module Magnum
  class Cli < Thor
    desc 'module', 'Module related tasks. Type \'magnum module\' for more help.'
    subcommand 'module', Module
  end
end
