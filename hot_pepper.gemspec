# frozen_string_literal: true

require_relative "lib/hot_pepper/version"

Gem::Specification.new do |spec|
  spec.name          = "hot_pepper"
  spec.version       = HotPepper::VERSION
  spec.authors       = ["keita"]
  spec.email         = ["keitahino0415@gmail.com"]

  spec.summary       = "API Client for hot pepper"
  spec.homepage      = "https://github.com/keita-hino/hot_pepper"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "faraday-encoding"
  
  spec.add_dependency "hashie"

  spec.add_dependency "bundler", "~> 2.0"
  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "rspec", "~> 3.0"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
