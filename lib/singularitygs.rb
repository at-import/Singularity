singularitygs_path = File.expand_path('../stylesheets', __FILE__)

if (defined? Compass)
  require 'breakpoint'
  Compass::Frameworks.register(
    "singularitygs",
    :stylesheets_directory => singularitygs_path
  )
else
  ENV["SASS_PATH"] = [ENV["SASS_PATH"], singularitygs_path].compact.join(File::PATH_SEPARATOR)
end

module SingularityGS
  VERSION = "1.2.2"
  DATE = "2014-07-24"
end
