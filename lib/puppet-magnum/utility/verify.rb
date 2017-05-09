require 'pathname'

module PuppetMagnum
  class Verify < Thor::Group

    include Thor::Actions
    include Thor::Shell

    argument :path,        type: :string, required: true
    argument :module_name, type: :string, required: true

    def verify_module
      # FIXME
    end

    private

    def target
      @target ||= Pathname.new(File.expand_path(path))
    end

  end
end
