class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :rounds
  has_many :guesses, :through => :rounds

  
end
