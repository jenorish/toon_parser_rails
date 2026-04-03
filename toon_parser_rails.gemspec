
Gem::Specification.new do |spec|
  spec.name          = "toon_parser_rails"
  spec.version       = "0.1.0"
  spec.summary       = "TOON to JSON parser middleware for Rails"
  spec.description   = "Rack middleware to parse TOON format and convert to JSON and JSON to TOON"
  spec.authors       = ["Kingston"]
  spec.email         = ["kingston@example.com"]
  spec.files         = Dir["lib/**/*", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
end
