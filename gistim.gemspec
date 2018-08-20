
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gistim/version"

Gem::Specification.new do |spec|
  spec.name          = "gistim"
  spec.version       = Gistim::VERSION
  spec.authors       = ["Yumainaura"]
  spec.email         = ["yuma.inaura@gmail.com"]

  spec.summary       = %q{gist gem improved wrapper}
  spec.description   = %q{gist gem improved wrapper}
  spec.homepage      = "https://github.com/YumaInaura/gistim"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gist", "~> 5"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0"
end
