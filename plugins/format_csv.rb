# csv fomat class
class FormatCsv
  def self.write_format(user_data, file_name)
    open("#{file_name}.csv", 'w') do |file|
      file.puts "#{user_data.user_name}, #{user_data.user_age},"\
       " #{user_data.user_city}"
    end
  end
end
