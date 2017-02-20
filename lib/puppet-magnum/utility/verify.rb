require 'pathname'
require_relative '../defaults'

module PuppetMagnum
  class Verify < Thor::Group

    include Thor::Actions
    include Thor::Shell

    argument :path,         type: :string, required: true
    argument :module_name,  type: :string, required: true

    def verify_module

      init_file = File.open(
        File.expand_path("#{path}/.puppet-magnum.init", __FILE__)).read

      version = init_file.scan( /\((.*)\)/).first.to_s

      puts "version: #{version}"
      puts PuppetMagnum::INIT_FILE

    end

    private

    def target
      @target ||= Pathname.new(File.expand_path(path))
    end

  end
end
