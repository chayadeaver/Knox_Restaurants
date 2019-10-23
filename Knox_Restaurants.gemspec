lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Knox_Restaurants/version"

Gem::Specification.new do |spec|
  spec.name          = "Knox_Restaurants"
  spec.version       = KnoxRestaurants::VERSION
  spec.authors       = ["Chaya Deaver"]
  spec.email         = ["chayadeaver@gmail.com"]
# for spec.summary and description you would have to fill it in later
  spec.summary       = %q{Sear}
  spec.description   = %q{asdasdas}
  spec.homepage      = "http://knoxrestaurants.com"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://knoxrestaurants.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] ="http://knoxrestaurants.com"
  spec.metadata["changelog_uri"] = "http://knoxrestaurants.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "httparty"
  spec.add_dependency "nokogiri"
end
