module Magnum
  class ModuleGenerator < BaseGenerator

    argument :module_name,
      type: :string,
      required: true

    class_option :maintainer,
      type: :string,
      default: 'Pearson, Inc.'

    class_option :copyright_holder,
      type: :string

    class_option :maintainer_email,
      type: :string,
      default: 'archautomation@pearson.com'

    class_option :license,
      type: :string,
      default: 'reserved'

    def write_emptydirs
      empty_directory target.join('spec')
      empty_directory target.join('files')
      empty_directory target.join('manifests')
      empty_directory target.join('templates')
    end

    def write_license
      template license_file, target.join('LICENSE')
    end

    def write_readme
      template 'README.md.erb', target.join('README.md')
    end

    def write_gemfile
      template 'Gemfile.erb', target.join('Gemfile')
    end

    def write_gitignore
      template 'gitignore.erb', target.join('.gitignore')
    end

    def write_modulefile
      template 'ModuleFile.erb', target.join('ModuleFile')
    end

    def write_rakefile
      template 'Rakefile.erb', target.join('Rakefile')
    end

    def write_spec_helper
      template 'spec_helper.rb.erb', target.join('spec/spec_helper.rb')
    end

    def write_manifests
      template 'init.pp.erb', target.join('manifests/init.pp')
    end

    private

    def commented(content)
      content.split("\n").collect { |s| "# #{s}" }.join("\n")
    end

    def license_name
      case options[:license]
      when 'apachev2'; 'Apache 2.0'
      when 'mit'; 'MIT'
      when 'reserved'; 'All rights reserved'
      else
        raise "Unknown license: '#{options[:license]}'"
      end
    end

    def license
      ERB.new(File.read(File.join(self.class.source_root, license_file))).result(binding)
    end

    def license_file
      case options[:license]
      when 'apachev2'; 'licenses/apachev2.erb'
      when 'mit'; 'licenses/mit.erb'
      when 'reserved'; 'licenses/reserved.erb'
      else
        raise "Unknown license: '#{options[:license]}'"
      end
    end

    def copyright_year
      Time.now.year
    end

    def copyright_holder
      options[:copyright_holder] || maintainer
    end

    def maintainer
      options[:maintainer]
    end

    def maintainer_email
      options[:maintainer_email]
    end

    def default_options
      { module_name: module_name }
    end

  end
end
