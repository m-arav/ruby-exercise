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
