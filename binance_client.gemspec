require_relative 'lib/binance_client/version'

Gem::Specification.new do |spec|
  spec.name          = "binance_client"
  spec.version       = BinanceClient::VERSION
  spec.authors       = ["Bloom Devs"]
  spec.email         = ["dev@bloom.solutions"]

  spec.summary       = "Ruby wrapper for Binance API"
  spec.description   = "Ruby wrapper for Binance API"
  spec.homepage      = "https://github.com/bloom-solutions/binance_client-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bloom-solutions/binance_client-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/bloom-solutions/binance_client-ruby/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "api_client_base", "~> 1.11"
  spec.add_dependency "activesupport"
  spec.add_dependency "typhoeus"

  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "wait"
end
