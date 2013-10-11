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
      default: 'Pearson, Inc.'

    class_option :maintainer_email,
      type: :string,
      default: 'archautomation@pearson.com'

    class_option :copyright_holder,
      type: :string

    def write_emptydirs
      empty_directory target.join('files')
      empty_directory target.join('manifests')
      empty_directory target.join('templates')
      empty_directory target.join('spec')
      empty_directory target.join('serverspec/spec')
      empty_directory target.join('vagrant')
    end

    def write_readme
      template 'README.md.erb', target.join('README.md')
    end

    def write_license
      template license_file, target.join('LICENSE')
    end

    def write_modulefile
      template 'puppet/ModuleFile.erb', target.join('ModuleFile')
    end

    def write_manifests
      template 'puppet/init.pp.erb', target.join('manifests/init.pp')
    end

    def write_spec_setup
      inside target do
        # use rspec-puppet-init to create spec folder layout
        run 'rspec-puppet-init &>/dev/null', capture: true
      end

      # for now we are controlling the spec_helper.rb file for rspec-puppet testing
      remove_file target.join('spec/spec_helper.rb')
      template 'spec/rspec/spec_helper.rb.erb', target.join('spec/spec_helper.rb')
      template 'spec/rspec/init_spec.rb.erb', target.join("spec/classes/#{module_name}_spec.rb")

      template 'spec/serverspec/spec_helper.rb.erb', target.join('serverspec/spec_helper.rb')
      template 'spec/serverspec/init_spec.rb.erb', target.join("serverspec/spec/#{module_name}_spec.rb")
    end

    def write_vagrantfile
      unless which('vagrant')
        say "\n\tNOTE: Vagrant does NOT appear to be installed." +
            "\n\tPlease install it from http://www.vagrantup.com/", :red
      end

      say "\n\tNOTE: Installing Vagrantfile with 'magnum-vagrant' box.\n", :green
      template 'vagrant/Vagrantfile.erb', target.join('Vagrantfile')
      template 'vagrant/vagrant.pp.erb', target.join('vagrant/vagrant.pp')
    end

    def write_gemfile
      template 'util/Gemfile.erb', target.join('Gemfile')
    end

    def write_rakefile
      template 'util/Rakefile.erb', target.join('Rakefile')
    end

    # setup the git configuration for this module; this function should be called last
    def write_git_setup
      template 'git/gitignore.erb', target.join('.gitignore')

      unless File.exists?(target.join('.git'))
        inside target do
          run 'git init', capture: true
          run 'git add -A', capture: true
          # disabled till a better solution is found - git doesn't want empty user information on commits
          # run "git commit -m 'Initial commit. Puppet module created by Magnum'", capture: true

          say "\n\tNOTE: Remember to setup a git repo and a remote to push your changes to.\n", :green
        end
      end

      template 'git/puppet-git-hooks-pre-commit.erb', target.join('.git/hooks/pre-commit')
      chmod target.join('.git/hooks/pre-commit'), 0755
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

    def default_options
      { module_name: module_name }
    end

  end
end
