require 'pathname'

module Magnum
  class BaseGenerator < Thor::Group
    include Thor::Actions

    argument :path,
      type: :string,
      required: true

    def self.source_root
      Magnum.root.join('generator_files')
    end

    private 

    def target
      @target ||= Pathname.new(File.expand_path(path))
    end

  end
end