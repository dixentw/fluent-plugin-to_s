# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'fluent/plugin/add/version'

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-to_s"
  spec.version       = "0.0.2"
  spec.authors       = ["airtoxin"]
  spec.email         = ["airtoxin@icloud.com"]
  spec.description   = %q{Plugin that adds whole record to to_s field}
  spec.summary       =  %q{Plugin that adds whole record to to_s field}
  spec.homepage      = "https://github.com/airtoxin/fluent-plugin-to_s"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "fluentd"
end
