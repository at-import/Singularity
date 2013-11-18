require 'compass'
require 'compass/exec'
require 'test/unit'


class TestCompassOutput < Test::Unit::TestCase

  Compass.add_configuration 'config.rb'
  Compass.configuration.project_path = Dir.pwd

  Compass.compiler.sass_files.each do |sass_file|
    test_name = File.basename(sass_file, '.*')

    define_method "test_#{test_name}_compile " do
      test_file_pwd = Compass.compiler.corresponding_css_file(sass_file)
      Compass.compiler.compile sass_file, test_file_pwd  # Raises exception upon error
      test_file = File.open(test_file_pwd).read;

      control_file_pwd = "#{Dir.pwd}/controls/#{File.basename(test_file_pwd)}"
      control_file = File.open(control_file_pwd).read;
      assert FileUtils.compare_file(test_file_pwd, control_file_pwd), "Compiled output for #{File.basename(sass_file)} does not match control output!"

    end
  end

end