require 'rake'
require 'colorize'
require 'rspec/core/rake_task'
require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'

desc 'Run unit tests'
task :unit do
  Rake::Task[:spec_prep].invoke
  Rake::Task[:spec_standalone].invoke
end
task :spec => []; Rake::Task[:spec].clear
task :spec => :unit

desc 'Run integration tests'
RSpec::Core::RakeTask.new(:integ) do |t|
  t.pattern = 'serverspec/**/*_spec.rb'
  t.rspec_opts = ['--color']
  Rake::Task[:spec_prep].invoke

  puts
  puts 'Running integration tests on Vagrant image, this can take a few moments...'.colorize( :red ).on_white.underline
  puts
end

desc 'Run all lint, unit, and integration tests'
task :test do
  Rake::Task[:lint].invoke
  Rake::Task[:unit].invoke
  Rake::Task[:integ].invoke
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
