class User < ActiveRecord::Base
  include BCrypt
  has_many :rounds
  has_many :guesses, :through => :rounds

  validates_presence_of :username, :message => "Please enter a username"
  validates_presence_of :password, :message => "Please enter a password"

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    if new_password.length > 0
      @password = Password.create(new_password)
      self.password_hash = @password
    else
      @password = ""
    end
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password 
      user
    else
      false
    end
  end 
end
