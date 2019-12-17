lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nmax/version"

Gem::Specification.new do |spec|
  spec.name          = "nmax"
  spec.version       = Nmax::VERSION
  spec.authors       = ["Drus566"]
  spec.email         = ["ahdpeu566@mail.ru"]
  spec.files         = Dir['lib/*.rb']
  spec.description   = 'Gets text data and prints n maximum numbers from text'
  spec.license       = "MIT"
  spec.summary       = ''
  spec.homepage      = 'https://github.com/Drus566/nmax'

  spec.executables   = ["nmax"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
