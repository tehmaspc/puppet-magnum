# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'magnum/version'

Gem::Specification.new do |spec|
  spec.name          = 'magnum'
  spec.version       = Magnum::VERSION
  spec.authors       = ['Tehmasp Chaudhri']
  spec.email         = ['tehmasp.chaudhri@pearson.com']
  spec.description   = %q{Pearson's tool for Puppet module development.}
  spec.summary       = %q{Magnum is useful for creating Puppet modules with the appropriate development testing frameworks and tasks.}
  spec.homepage      = 'https://devops-tools.pearson.com/stash/projects/CD/repos/magnum'
  spec.license       = 'All Rights Reserved'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'thor', '~> 0.18.1'
  spec.add_development_dependency 'version', '~> 1.0.0'
end