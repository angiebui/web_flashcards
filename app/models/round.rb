class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  def increment_score!
    self.score += 1
    self.save
  end
end
