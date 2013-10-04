require 'rubygems'
require 'thor'
require 'pathname'

module Magnum
  autoload :BaseGenerator,      'magnum/generators/base_generator'
  autoload :CreateGenerator,    'magnum/generators/create_generator'
  autoload :InitGenerator,      'magnum/generators/init_generator'
  autoload :Cli,                'magnum/cli'
  autoload :Module,             'magnum/cli/module'

  def self.root
    @root ||= Pathname.new(File.expand_path('../', File.dirname(__FILE__)))
  end
end
