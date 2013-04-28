require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, :uniqueness => true
  validates :name, :length => {:minimum => 3}
  validates :password, :length => {:minimum => 6}

  has_many :decks, :through => :rounds
  has_many :rounds 

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password) 
     user = User.where("email = ?", email).first
     if user && user.password == password
       user 
     else
       nil  
     end
  end
end

