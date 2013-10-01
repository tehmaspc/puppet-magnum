require 'thor'
require 'pathname'

module Magnum
  autoload :BaseGenerator,      'magnum/generators/base_generator'
  autoload :ModuleGenerator,    'magnum/generators/module_generator'
  autoload :Cli,                'magnum/cli'
  autoload :Module,             'magnum/cli/module'

  def self.root
    @root ||= Pathname.new(File.expand_path('../', File.dirname(__FILE__)))
  end
end
