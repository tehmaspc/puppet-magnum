require 'bundler/gem_tasks'
require 'rake/version_task'

Rake::VersionTask.new

desc 'Display the list of available rake tasks'
task :help do
  system 'rake -T'
end

task :default => 'build'
