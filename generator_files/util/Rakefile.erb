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

desc 'Run syntax, lint and unit tests'
task :test do
  Rake::Task[:syntax].invoke
  Rake::Task[:lint].invoke
  Rake::Task[:unit].invoke
end

# puppet-lint options
Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ['spec/**/*.pp']
  config.log_format = '%{path}:%{linenumber}:%{check}:%{KIND}:%{message}'
  config.disable_checks = [ "class_inherits_from_params_class", "disable_autoloader_layout", "80chars" ]
  config.fail_on_warnings = false
end

# remove undesired rake tasks
task :build => []; Rake::Task[:build].clear
task :clean => []; Rake::Task[:clean].clear
task :default => []; Rake::Task[:default].clear
task :default => :test
