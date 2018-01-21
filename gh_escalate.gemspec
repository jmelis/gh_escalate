# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'gh_escalate/version'

Gem::Specification.new do |spec|
  spec.name          = "gh_escalate"
  spec.version       = GHEscalate::VERSION

  spec.summary       = %q{Escalate GH Issues}
  spec.description   = %q{Escalate GH Issues}

  spec.authors       = "Jaime Melis"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
