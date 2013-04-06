require 'compass'
require 'breakpoint'

Compass::Frameworks.register("singularitygs", :path => "#{File.dirname(__FILE__)}/..")

module SingularityGS
  VERSION = "1.0.6"
  DATE = "2013-06-05"
end