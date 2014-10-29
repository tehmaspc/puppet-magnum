require 'rake'
require 'colorize'
require 'rspec/core/rake_task'
require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'

def check_magnum_vagrant_box
  # check for the existence of the 'magnum-vagrant' vagrant box;
  # if NOT found, then alert user that it will be downloaded.
  puts "wont check this right now"
  end

def prompt_integ_test_run
  puts
  puts 'Running integration tests on Vagrant image; this will take a few moments...'.colorize(:red).on_white.underline
  puts
end

desc 'Run unit tests'
task :unit do
  Rake::Task[:spec_prep].invoke
  Rake::Task[:spec_standalone].invoke
end
task :spec => []; Rake::Task[:spec].clear
task :spec => :unit

desc 'Run integration tests'
RSpec::Core::RakeTask.new(:integ) do |t|
  Rake::Task[:spec_prep].invoke
  ENV['TARGET_HOST'] = 'default'
  t.pattern = 'serverspec/**/*_spec.rb'
  t.rspec_opts = ['--color']
  Rake::Task[:spec_prep].invoke

  check_magnum_vagrant_box
  prompt_integ_test_run
end

desc 'Run all lint, unit, and integration tests'
task :test do
  Rake::Task[:lint].invoke
  Rake::Task[:unit].invoke
  Rake::Task[:integ].invoke
end

desc 'Install git hooks'
task :install_git_hooks do
  source = "#{Dir.pwd}/.git_hooks"
  target = './.git/hooks'
  git_hooks_available = Dir.entries(source)
  git_hooks_available.each do |hook|
    if (hook != '.' and hook != '..' and hook != 'README.md') then
      FileUtils.rm_rf  "#{target}/#{hook}"
      FileUtils::cp "#{source}/#{hook}", "#{target}/#{hook}"
      FileUtils::chmod 0755, "#{target}/#{hook}"
    end
  end
  FileUtils::touch '.git_hooks_installed'
end

# remove undesired rake tasks
task :build => []; Rake::Task[:build].clear
task :clean => []; Rake::Task[:clean].clear
task :coverage => []; Rake::Task[:coverage].clear

task :default => []; Rake::Task[:default].clear
task :default => :test

# puppet-lint options
PuppetLint.configuration.ignore_paths = ['spec/**/*.pp']
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_autoloader_layout')
