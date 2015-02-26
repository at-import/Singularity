base_directory  = File.expand_path(File.join(File.dirname(__FILE__), '..'))
singularitygs_sass_path = File.join(base_directory, 'stylesheets')

if (defined? Compass)
  require 'breakpoint'
  Compass::Frameworks.register(
    "singularitygs",
    :path => base_directory
  )
else
  ENV["SASS_PATH"] = [ENV["SASS_PATH"], singularitygs_sass_path].compact.join(File::PATH_SEPARATOR)
end

module SingularityGS
  VERSION = "1.6.2"
  DATE = "2015-02-26"
end
