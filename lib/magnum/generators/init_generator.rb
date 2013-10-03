module Magnum
  class InitGenerator < BaseGenerator

    argument :module_path,
      type: :string,
      required: true

  end
end
