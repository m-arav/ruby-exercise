# plain text fomat class
class FormatPlaintext
  def self.write_format(user_data, file_name)
    open("#{file_name}.txt", 'w') do |file|
      file.puts "#{user_data.user_name}, #{user_data.user_age},"\
       " #{user_data.user_city}"
    end
  end
end
