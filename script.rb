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
  def self.read_in_data
    ['Name', 'City', 'Age', 'File name'].each do |content|
      print "#{content} : "
      STDOUT.flush
      yield
    end
  end
end

# The plugin processing logic and controlling logic
class Controller
  def stub_load_plugin
    puts 'needed later'
  end

  def call_read
    result = []
    UserView.read_in_data { result << gets.chomp }
    @file_name = result[3]
    @data_object = UserModel.new(result[0], result[1], result[2])
  end

  def write_format
    # will need plugin based write
    open(@file_name, 'w') do |file|
      file.puts "#{@data_object.user_name}, #{@data_object.user_age},"\
       " #{@data_object.user_city}"
    end
  end

  def start
    call_read
    write_format
  end
end

# main for now

program = Controller.new
program.start
