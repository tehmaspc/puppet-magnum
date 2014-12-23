require 'thor'

module Magnum
  class Module < Thor

    desc 'create [MODULE_NAME]', 'Creates a new Puppet module.'
    def create(module_name)
      Magnum::CreateGenerator.new([File.join(Dir.pwd, module_name), module_name], options).invoke_all
    end

    desc 'init [MODULE_NAME]', 'Initializes an existing Puppet module.'
    def init(module_name)
      Magnum::CreateGenerator.new([File.join(Dir.pwd, module_name), module_name], options).invoke_all
    end

    def self.banner(task, namespace = false, subcommand = true)
      "#{basename} #{task.formatted_usage(self, namespace, subcommand).split(':').join(' ')}"
    end

  end
end
