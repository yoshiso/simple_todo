# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_todo/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_todo"
  spec.version       = SimpleTodo::VERSION
  spec.authors       = ["yss44"]
  spec.email         = ["nya060@gmail.com"]
  spec.summary       = %q{Simple task management tool.}
  spec.description   = %q{Simple task management tool}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
  spec.add_dependency 'thor'
  spec.add_dependency "activerecord"
  spec.add_dependency "sqlite3"

end
