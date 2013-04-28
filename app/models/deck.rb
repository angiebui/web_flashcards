class Deck < ActiveRecord::Base
  has_many :users, :through => :rounds
  has_many :rounds
  has_many :cards
end