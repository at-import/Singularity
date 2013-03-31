require 'compass'
require 'modular-scale'
require 'breakpoint'

Compass::Frameworks.register("singularitygs", :path => "#{File.dirname(__FILE__)}/..")

module SingularityGS
  VERSION = "1.0.0"
  DATE = "2013-03-30"
end