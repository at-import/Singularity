module SingularityGS

  VERSION = "1.2.0.rc.7"
  DATE = "2014-03-11"

  class << self
    def load!
      require 'breakpoint'
      register_compass_extension if compass?
    end

    def compass?
      defined?(::Compass)
    end

    def register_compass_extension
      ::Compass::Frameworks.register(
        "singularitygs",
        :path => "#{File.dirname(__FILE__)}/.."
      )
    end
  end

end