if (defined? Compass)
  require 'breakpoint'
  Compass::Frameworks.register(
    "singularitygs",
    :path => "#{File.dirname(__FILE__)}/.."
  )
end

module SingularityGS
  VERSION = "1.2.1"
  DATE = "2014-05-03"
end
