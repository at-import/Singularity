require 'breakpoint'

if (defined? Compass)
  Compass::Frameworks.register(
    "singularitygs",
    :path => "#{File.dirname(__FILE__)}/.."
  )
end

module SingularityGS
  VERSION = "1.2.0.rc.7"
  DATE = "2014-03-11"
end