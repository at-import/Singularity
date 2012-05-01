# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{singularity}
  s.version = "0.9.0.beta01"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6")
  s.authors = ["Scott Kellum"]
  s.date = %q{2012-06-05}
  s.description = %q{Singularity is a mobile first responsive grid framework designed to be intelligent, light weight, and easy to use.}
  s.email = %w{scott@scottkellum.com}
  s.has_rdoc = false
  # Gem Files
  s.files = ["README.mdown"]
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")
  s.files += Dir.glob("templates/**/*.*")

  # Gem Bookkeeping
  s.required_rubygems_version = ">= 1.3.6"
  s.rubygems_version = %q{1.3.6}
  s.add_dependency("compass", [">= 0.12"])
  s.add_dependency("modular-scale")
  s.add_dependency("color-schemer")

  s.homepage = %q{http://singularity.gs/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{singularity}
  s.summary = %q{Singularity is a small and light weight grid framework for Sass}
end