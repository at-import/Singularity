# -*- encoding: utf-8 -*-
require './lib/singularitygs'

Gem::Specification.new do |s|
  # General Project Information
  s.name = "singularitygs"
  s.version = SingularityGS::VERSION
  s.date = SingularityGS::DATE
  s.rubyforge_project = "singularitygs"
  s.rubygems_version = "1.7.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")

  # Author Information
  s.authors = ["Scott Kellum", "Sam Richard"]
  s.email = ["scott@scottkellum.com", "snugug@gmail.com"]
  s.homepage = "http://singularity.gs"
  s.licenses = ["MIT"]

  # Project Description
  s.description = "Advanced responsive grid system for Sass and Compass"
  s.summary = "Singularity is a fluid grid system that can generate uniform columns as well as asymmetric and compound grids. It is designed to be extensible, adding additional outputs or grid generators are easy, and the core syntax is simple to build upon for custom input syntaxes."

  # Files to Include
  s.files = Dir.glob("lib/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  # Dependent Gems
  s.add_dependency 'sass',                "~> 3.3"
  s.add_dependency 'breakpoint',          "~> 2.4"
end