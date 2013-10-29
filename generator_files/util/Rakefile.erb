require 'rake'
require 'rspec/core/rake_task'
require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'

desc 'Run unit tests'
task :spec => []; Rake::Task[:spec].clear
task :spec do
  Rake::Task[:spec_prep].invoke
  Rake::Task[:spec_standalone].invoke
end
task :unit => :spec

desc 'Run integration tests'
RSpec::Core::RakeTask.new(:integ) do |t|
  t.pattern = 'serverspec/**/*_spec.rb'
  t.rspec_opts = ['--color']
  Rake::Task[:spec_prep].invoke
end

desc 'Run all lint, unit, and integration tests'
task :test do
  Rake::Task[:lint].invoke
  Rake::Task[:unit].invoke
  Rake::Task[:integ].invoke
end

task :default => []; Rake::Task[:default].clear
task :default => :test

# puppet-lint options
PuppetLint.configuration.send('disable_80chars')
