$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "breadcrumb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "breadcrumb"
  s.version     = Breadcrumb::VERSION
  s.authors     = ["Marcelo Jacobus"]
  s.email       = ["marcelo.jacobus@gmail.com"]
  s.homepage    = "http://github.com/mjacobus/breadcrumb"
  s.license     = 'MIT'
  s.summary     = "Breadcrumb Helper"
  s.description = "Breadcrumb Helper"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.0", "< 5.0.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
end
