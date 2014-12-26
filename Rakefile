require 'yard'
require 'bundler/gem_tasks'
require 'rake/version_task'
require 'rspec/core/rake_task'

Rake::VersionTask.new
YARD::Rake::YardocTask.new

desc 'Run unit tests'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = ['--color --format progress']
end

desc 'Start a local YARD documentation server'
task :yard_server do
  system 'yard server -q -B localhost -p 9999'
end

desc 'Display the list of available rake tasks'
task :help do
  system 'rake -T'
end

task :unit    => 'spec'
task :test    => 'spec'
task :default => 'spec'
