require 'thor'
require 'pathname'

module PuppetMagnum

  autoload :Cli,                'puppet-magnum/cli'
  autoload :Module,             'puppet-magnum/cli/module'

  autoload :Verify,             'puppet-magnum/utility/verify'

  autoload :BaseGenerator,      'puppet-magnum/generators/base_generator'
  autoload :CreateGenerator,    'puppet-magnum/generators/create_generator'

  def self.root
    @root ||= Pathname.new(File.expand_path('../', File.dirname(__FILE__)))
  end

end
