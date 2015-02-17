require 'rake'
require 'colorize'
require 'rspec/core/rake_task'
require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'

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

  t.pattern = 'serverspec/**/*_spec.rb'
  t.rspec_opts = ['--color']
  Rake::Task[:spec_prep].invoke

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
task :beaker => []; Rake::Task[:beaker].clear
task :beaker_nodes => []; Rake::Task[:beaker_nodes].clear

task :default => []; Rake::Task[:default].clear
task :default => :test

# puppet-lint options
Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ['spec/**/*.pp']
  config.log_format = '%{path}:%{linenumber}:%{check}:%{KIND}:%{message}'
  config.disable_checks = [ "class_inherits_from_params_class", "disable_autoloader_layout", "80chars" ]
  config.fail_on_warnings = false
end
