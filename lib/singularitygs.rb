require 'compass'
require 'breakpoint'

Compass::Frameworks.register("singularitygs", :path => "#{File.dirname(__FILE__)}/..")

module SingularityGS
  VERSION = "1.2.0.rc.3"
  DATE = "2014-01-17"
end