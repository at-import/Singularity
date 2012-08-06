require 'compass'
require 'modular-scale'
require 'breakpoint'

Compass::Frameworks.register("singularitygs", :path => "#{File.dirname(__FILE__)}/..")

module SingularityGS
  VERSION = "0.0.10"
  DATE = "2012-08-06"
end