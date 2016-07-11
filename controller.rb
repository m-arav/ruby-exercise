require_relative 'plugin_loader'
require_relative 'user_model'
require_relative 'user_view'
# The controlling logic
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
