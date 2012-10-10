require 'compass'
require 'modular-scale'
require 'breakpoint'

Compass::Frameworks.register("singularitygs", :path => "#{File.dirname(__FILE__)}/..")

module SingularityGS
  VERSION = "0.0.14"
  DATE = "2012-10-10"
end