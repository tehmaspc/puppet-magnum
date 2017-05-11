module PuppetMagnum
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

    # first, remove ANY unused legacy files and directories.
    # (migration function from `puppet-magnum` 3.x to 4.x)
    def write_remove_legacy_files_dirs
      if File.exist?(target.join('.puppet-magnum.init'))

        legacy_files = ['.vagrant_puppet', 'Vagrantfile']
        legacy_files.each do |legacy_file|
          if File.exist?(target.join("#{legacy_file}"))
            remove_file target.join("#{legacy_file}")
          end
        end

        legacy_dirs = ['spec', 'serverspec']
        legacy_dirs.each do |legacy_dir|
          if File.exist?(target.join("#{legacy_dir}"))
            directory target.join("#{legacy_dir}"), target.join("#{legacy_dir}.old")
            remove_file target.join("#{legacy_dir}")
          end
        end

        remove_file target.join('.puppet-magnum.init')
      end
    end

    def write_dirs
      dirs = ['manifests', 'data', 'templates', 'files',
              'spec', 'spec/fixtures', 'spec/fixtures/modules',
              'spec/acceptance', 'spec/acceptance/nodesets', 'spec/acceptance/nodesets/docker',
             ]

      dirs.each do |dir|
        empty_directory target.join("#{dir}")
      end
    end

    def write_base_files
      template license_file,            target.join('LICENSE')
      template 'base/README.md.erb',    target.join('README.md')
      template 'base/CHANGELOG.md.erb', target.join('CHANGELOG.md')
    end

    def write_util_files
      remove_file target.join('Gemfile')
      remove_file target.join('Rakefile')
      remove_file target.join('.puppet-magnum')

      template 'util/Gemfile.erb', target.join('Gemfile')
      template 'util/Rakefile.erb', target.join('Rakefile')
      template 'util/puppet-magnum.erb', target.join('.puppet-magnum')
    end

    def write_puppet_files
      template 'puppet/metadata.json.erb', target.join('metadata.json')
      template 'puppet/init.pp.erb',       target.join('manifests/init.pp')
      template 'puppet/hiera.yaml.erb',    target.join('hiera.yaml')
      template 'puppet/common.yaml.erb',   target.join('data/common.yaml')
    end

    def write_spec_setup
      template 'spec/fixtures.yml.erb',              target.join('.fixtures.yml')
      template 'spec/rspec.erb',                     target.join('.rspec')
      template 'spec/spec_helper_acceptance.rb.erb', target.join('spec/spec_helper_acceptance.rb')
      template 'spec/acceptance/init_spec.rb.erb',   target.join("spec/acceptance/#{module_name}_spec.rb")

      beaker_sut_files = [
        'ubuntu-server-1404-x64.yml',
        'ubuntu-server-1604-x64.yml',
      ]

      beaker_sut_files.each do |beaker_sut_file|
        # VirtualBox
        template "spec/acceptance/#{beaker_sut_file}.erb", target.join("spec/acceptance/nodesets/#{beaker_sut_file}")
        # Docker
        template "spec/acceptance/docker/#{beaker_sut_file}.erb", target.join("spec/acceptance/nodesets/docker/#{beaker_sut_file}")
      end
    end

    # due to the 'git add' operation, this function should be called last.
    def write_git_setup
      remove_file target.join('.gitignore')
      template 'git/gitignore.erb', target.join('.gitignore')

      unless File.exists?(target.join('.git'))
        inside target do
          run 'git init', capture: true
          run 'git add -A', capture: true
        end
      end
    end

    private

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

    def puppet_magnum_init_date
      Time.now.ctime
    end

    def puppet_magnum_init_version
      PuppetMagnum::VERSION.chomp
    end

    def default_options
      { module_name: module_name }
    end

  end
end
