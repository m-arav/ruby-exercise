require 'prawn'

# pdf fomat class
class FormatPdf
  def self.write_format(user_data, file_name)
    Prawn::Document.generate("#{file_name}.pdf") do
      text "#{user_data.user_name}, #{user_data.user_age},"\
       " #{user_data.user_city}"
    end
  end
end
