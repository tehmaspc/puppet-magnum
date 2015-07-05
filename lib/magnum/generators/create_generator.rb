module Magnum
  class CreateGenerator < BaseGenerator

    argument :module_name,
      type: :string,
      required: true

    class_option :license,
      type: :string,
      default: 'reserved'

    class_option :maintainer,
      type: :string,
      default: 'Example, Inc.'

    class_option :maintainer_email,
      type: :string,
      default: 'puppet@example.com'

    class_option :copyright_holder,
      type: :string
    
    class_option :puppetfile_git_source,
      type: :string

    def write_emptydirs
      empty_directory target.join('manifests')
      empty_directory target.join('templates')
      empty_directory target.join('files')
      empty_directory target.join('spec')
      empty_directory target.join('serverspec/spec')
      empty_directory target.join('.vagrant_puppet')
    end

    def write_readme
      template 'README.md.erb', target.join('README.md')
    end

    def write_license
      template license_file, target.join('LICENSE')
    end

    def write_metadata_json
      template 'puppet/metadata.json.erb', target.join('metadata.json')
    end

    def write_modulefile
      template 'puppet/Modulefile.erb', target.join('Modulefile')
    end

    def write_manifests_templates_files
      template 'puppet/init.pp.erb', target.join('manifests/init.pp')

      create_file target.join('templates/.gitkeep')
      create_file target.join('files/.gitkeep')
    end

    def write_spec_setup
      spec_dirs = [ 'classes', 'defines', 'functions', 'hosts', 'unit' ]
      spec_dirs.each do |dir|
        empty_directory target.join("spec/#{dir}")
      end

      empty_directory target.join('spec/fixtures/manifests')
      create_file target.join('spec/fixtures/manifests/site.pp')

      empty_directory target.join("spec/fixtures/modules/#{module_name}")
      spec_dirs = ['manifests', 'templates', 'files']
      spec_dirs.each { |spec_dir|
        remove_file target.join("spec/fixtures/modules/#{module_name}/#{spec_dir}")
        create_link target.join("spec/fixtures/modules/#{module_name}/#{spec_dir}"), "../../../../#{spec_dir}"
      }

      template 'spec/rspec/spec_helper.rb.erb', target.join('spec/spec_helper.rb')
      template 'spec/rspec/init_spec.rb.erb', target.join("spec/classes/#{module_name}_spec.rb")
    end

    def write_serverspec_setup
      template 'spec/serverspec/spec_helper.rb.erb', target.join('serverspec/spec_helper.rb')
      template 'spec/serverspec/init_spec.rb.erb', target.join("serverspec/spec/#{module_name}_spec.rb")
    end

    def write_fixtures
       template 'spec/fixtures.yml.erb', target.join('.fixtures.yml')
    end

    def write_gemfile
      remove_file target.join('Gemfile')
      template 'util/Gemfile.erb', target.join('Gemfile')
    end

    def write_rakefile
      remove_file target.join('Rakefile')
      template 'util/Rakefile.erb', target.join('Rakefile')
    end

    def write_vagrantfile
      unless which('vagrant')
        say "\n\tNOTE: Vagrant does NOT appear to be installed." +
            "\n\tPlease install it from http://www.vagrantup.com/\n", :red
      end

      template 'vagrant/Vagrantfile.erb', target.join('Vagrantfile')
      template 'vagrant/init.sh.erb', target.join('.vagrant_puppet/init.sh')
      template 'vagrant/init.pp.erb', target.join('.vagrant_puppet/init.pp')
    end

    def write_magnum_lastinit
      remove_file target.join('Magnum.lastinit')
      template 'Magnum.lastinit.erb', target.join('Magnum.lastinit')
    end

    # due to the 'git add' operation, this function should be called last
    def write_git_setup
      remove_file target.join('.gitignore')
      template 'git/gitignore.erb', target.join('.gitignore')

      template 'git/puppet-git-hooks-pre-commit.erb', target.join('.git_hooks/pre-commit')
      template 'git/branch-prefix-prepare-commit-msg.erb', target.join('.git_hooks/prepare-commit-msg')
      chmod target.join('.git_hooks/pre-commit'), 0755
      chmod target.join('.git_hooks/prepare-commit-msg'), 0755

      unless File.exists?(target.join('.git'))
        inside target do
          run 'git init', capture: true
          run 'git add -A', capture: true
        end
        template 'git/puppet-git-hooks-pre-commit.erb', target.join('.git/hooks/pre-commit')
        template 'git/branch-prefix-prepare-commit-msg.erb', target.join('.git/hooks/prepare-commit-msg')
        chmod target.join('.git/hooks/pre-commit'), 0755
        chmod target.join('.git/hooks/prepare-commit-msg'), 0755

        create_file target.join('.git_hooks_installed')
      end
    end

    private

    def commented(content)
      content.split("\n").collect { |s| "# #{s}" }.join("\n")
    end

    def license_name
      case options[:license]
      when 'apachev2'; 'Apache 2.0'
      when 'mit'; 'MIT'
      when 'reserved'; 'All Rights Reserved'
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

    def which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable? exe
        }
      end
      return nil
    end

    def maintainer
      options[:maintainer]
    end

    def maintainer_email
      options[:maintainer_email]
    end

    def copyright_year
      Time.now.year
    end

    def copyright_holder
      options[:copyright_holder] || maintainer
    end

    def magnum_lastinit_timestamp
      "Magnum (#{Magnum::VERSION.chomp}) last initialized this Puppet module directory on #{Time.now.ctime}."
    end

    def puppetfile_git_source
      options[:puppetfile_source]
    end

    def default_options
      { module_name: module_name }
    end
  end
end
