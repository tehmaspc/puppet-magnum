require 'thor'
require 'yaml'

module PuppetMagnum
  class Module < Thor

    desc 'create [MODULE_NAME]', 'Creates a new Puppet module.'
    def create(module_name)
      PuppetMagnum::CreateGenerator.new([File.join(Dir.pwd, module_name), module_name], options).invoke_all
    end

    desc 'init [MODULE_NAME]', 'Initializes an existing Puppet module.'
    def init(module_name)
      PuppetMagnum::CreateGenerator.new([File.join(Dir.pwd, module_name), module_name], options).invoke_all
    end

    desc 'verify [MODULE_NAME]', 'Verifies the Puppet module.'
    def verify(module_name)
      PuppetMagnum::Verify.new([File.join(Dir.pwd, module_name), module_name], options).invoke_all
    end

    def self.banner(task, namespace = false, subcommand = true)
      "#{basename} #{task.formatted_usage(self, namespace, subcommand).split(':').join(' ')}"
    end

    private

    def options
      original_options = super

      config_file = File.expand_path('~/.magnumrc')
      return original_options unless File.exists?(config_file)

      defaults = ::YAML::load_file(config_file) || {}
      Thor::CoreExt::HashWithIndifferentAccess.new(defaults.merge(original_options))
    end

  end
end
