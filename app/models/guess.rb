class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  def self.check(answer, prior_card, round)
    if answer == prior_card.answer
      self.create(card_id: prior_card.id, round_id: round.id, correct: true)
    else
      self.create(card_id: prior_card.id, round_id: round.id, correct: false)
    end
  end

end
