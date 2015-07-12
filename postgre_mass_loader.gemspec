# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postgre_mass_loader/version'

Gem::Specification.new do |spec|
  spec.name          = "postgre_mass_loader"
  spec.version       = PostgreMassLoader::VERSION
  spec.authors       = ["ukolovda"]
  spec.email         = ["udmitry@mail.ru"]
  spec.summary       = %q{PostgreSQL mass loader gem}
  spec.description   = %q{Transfer data through native CSV loader.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
