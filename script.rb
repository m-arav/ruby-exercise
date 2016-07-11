# Contains information about the Data Model to be used 
class UserModel
  attr_accessor :user_name, :user_city, :user_age

  def initialize(name, city, age)
    @user_name = name
    @user_city = city
    @user_age = age
  end
end

# Display components
class UserView
  def self.display_format(format_list)
    format_list.each_with_index { |val, index| puts "#{index + 1})  #{val}" }
  end

  def self.read_in_data
    ['Name', 'City', 'Age', 'File name'].each do |content|
      print "#{content} : "
      STDOUT.flush
      yield
    end
  end

  def self.load_choice
    print 'Enter choice : '
    gets.chomp.to_i
  end
end

# The plugin processing logic and controlling logic
class Controller

  def call_read
    result = []
    UserView.read_in_data { result << gets.chomp }
    @file_name = result[3]
    @data_object = UserModel.new(result[0], result[1], result[2])
  end

  def write_format
    class_name = @call_list[@choice - 1]
    class_object = Object.const_get(class_name)
    class_object.write_format(@data_object, @file_name)
  end

  def start
    @call_list = PluginLoader.new.find_plugins
    @choice = UserView.load_choice
    call_read
    write_format
  end
end

# processing Plugins
class PluginLoader
  def initialize
    @format_list = []
    @class_list = []
  end

  def find_plugins
    Dir.chdir('plugins')
    Dir.glob('*.rb') do |file|
      @format_list << file
      require_relative "plugins/#{file}"
    end
    formatconversion
    Dir.chdir('..')
    @class_list
  end

  def formatconversion
    @format_list.each do |name|
      sample = name[0].upcase + name[1..-4]
      sample[sample.index('_') + 1] = sample[sample.index('_') + 1].upcase
      @class_list << sample.sub('_', '')
    end
    UserView.display_format(@class_list)
  end
end

# main for now
program = Controller.new
program.start
