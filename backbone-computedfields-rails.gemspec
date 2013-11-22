# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backbone-computedfields-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "backbone-computedfields-rails"
  spec.version       = Backbone::ComputedFields::Rails::VERSION
  spec.authors       = ["Stafford Brunk"]
  spec.email         = ["stafford.brunk@gmail.com"]
  spec.description   = %q{Computed fields for Backbone.Models, polished for real project needs}
  spec.summary       = %q{Packages the backbone.computedfields library for use with the asset pipline}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
