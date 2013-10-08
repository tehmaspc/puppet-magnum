module Magnum
  class Module < Thor

    desc "create [MODULE_NAME]", "Creates a new Puppet module."
    def create(module_name)
      Magnum::CreateGenerator.new([File.join(Dir.pwd, module_name), module_name], options).invoke_all
    end

    # desc "init [MODULE_PATH]", "Initializes an existing Puppet module."
    # def init(module_path)
    #   Magnum::InitGenerator.new([File.join(Dir.pwd, module_path), module_path], options).invoke_all
    # end

    def self.banner(task, namespace = false, subcommand = true)
      "#{basename} #{task.formatted_usage(self, namespace, subcommand).split(':').join(' ')}"
    end

  end
end