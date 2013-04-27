class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck



  def correct
    self.score += 1 
  end

  def next_card
    
  end
end
