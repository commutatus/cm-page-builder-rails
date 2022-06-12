$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "cm_page_builder/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "cm_page_builder-rails"
  spec.version     = CmPageBuilder::Rails::VERSION
  spec.authors     = ["Camilo Ernesto Forero Junco"]
  spec.email       = ["camilo@commutatus.com"]
  spec.homepage    = "https://commutatus.com"
  spec.summary     = "Summary of CmPageBuilder::Rails."
  spec.description = "Description of CmPageBuilder::Rails."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.test_files = Dir["spec/**/*"]

  spec.add_dependency 'rails', '>= 6.0'
  spec.add_dependency "slim-rails", "~> 3.2.0"


  spec.add_development_dependency "pg"
  spec.add_development_dependency "rspec-rails", '~> 3.8'
end
