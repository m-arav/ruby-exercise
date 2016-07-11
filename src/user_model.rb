# Contains information about the Data Model to be used
class UserModel
  attr_accessor :user_name, :user_city, :user_age

  def initialize(name, city, age)
    @user_name = name
    @user_city = city
    @user_age = age
  end
end
