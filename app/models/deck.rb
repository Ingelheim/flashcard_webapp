class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  def answer_array(current_card)
    correct = current_card.answer
    array = []
    array << correct

      self.cards.shuffle.each do |card|
        unless card.answer.downcase == correct.downcase
          array << card.answer 
          break if array.count == 4   
        end
    end      
    array.shuffle
  end


end
