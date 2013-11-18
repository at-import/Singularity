require 'compass'
require 'compass/exec'
require 'test/unit'
require 'diffy'

class TestCompassOutput < Test::Unit::TestCase

  Compass.add_configuration 'config.rb'
  Compass.configuration.project_path = Dir.pwd

  # Remove all current Diff files
  Dir.glob("#{Dir.pwd}/tests/**/*.css.diff").each { |f| File.delete(f) }

  Compass.compiler.sass_files.each do |sass_file|
    test_name = File.basename(sass_file, '.*')

    define_method "test_#{test_name}_compile " do
      test_file_pwd = Compass.compiler.corresponding_css_file(sass_file)
      Compass.compiler.compile sass_file, test_file_pwd  # Raises exception upon error

      control_file_pwd = "#{Dir.pwd}/controls/#{File.basename(test_file_pwd)}"

      begin
        passed = assert FileUtils.compare_file(test_file_pwd, control_file_pwd), "Compiled output for #{File.basename(sass_file)} does not match control output!"
      ensure
        if !passed
          test_file = File.open(test_file_pwd).read;
          control_file = File.open(control_file_pwd).read;
          diff_pwd = "#{Dir.pwd}/tests/#{File.basename(test_file_pwd)}.diff"
          diff_content = Diffy::Diff.new(control_file, test_file, :include_diff_info => true)

          File.open(diff_pwd, 'w') { |f| f.write(diff_content.to_s(:text)) }

          puts "Diff of compiled file into control file available at #{diff_pwd}"
        end
      end
    end
  end
end

