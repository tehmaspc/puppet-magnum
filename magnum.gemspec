# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'magnum/version'

Gem::Specification.new do |spec|
  spec.name          = 'magnum'
  spec.version       = Magnum::VERSION
  spec.authors       = ['Tehmasp Chaudhri']
  spec.email         = ['tehmasp@gmail.com', 'tehmasp.chaudhri@pearson.com']
  spec.description   = %q{Magnum - a tool for rapid, consistent, and best practice Puppet module development.}
  spec.summary       = %q{Magnum - a tool for rapid, consistent, and best practice Puppet module development.}
  spec.homepage      = 'https://devops-tools.pearson.com/stash/projects/CD/repos/magnum'
  spec.license       = 'All Rights Reserved'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'thor', '~> 0.18.1'
  spec.add_development_dependency 'version', '~> 1.0.0'
  spec.add_development_dependency 'rspec-puppet', '~> 0.1.6'
  spec.add_development_dependency 'serverspec', '~> 0.9.7'
end
