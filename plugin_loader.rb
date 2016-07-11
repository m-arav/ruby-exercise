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
    format_conversion
    Dir.chdir('..')
    @class_list
  end

  def format_conversion
    @format_list.each do |name|
      sample = name[0].upcase + name[1..-4]
      sample[sample.index('_') + 1] = sample[sample.index('_') + 1].upcase
      @class_list << sample.sub('_', '')
    end
    UserView.display_format(@class_list)
  end
end
