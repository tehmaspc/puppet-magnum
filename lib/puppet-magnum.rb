require 'thor'
require 'pathname'

module PuppetMagnum
  autoload :BaseGenerator,      'puppet-magnum/generators/base_generator'
  autoload :CreateGenerator,    'puppet-magnum/generators/create_generator'
  autoload :Cli,                'puppet-magnum/cli'
  autoload :Module,             'puppet-magnum/cli/module'

  def self.root
    @root ||= Pathname.new(File.expand_path('../', File.dirname(__FILE__)))
  end
end
