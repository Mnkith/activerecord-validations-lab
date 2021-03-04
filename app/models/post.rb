class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :title_is_not_clickbaity


  def title_is_not_clickbaity
    unless title&.match?(/\bWon't Believe\b|\bSecret\b|\bTop \d+\b|\bGuess\b/i) 
      errors.add(:title, "this isn't appealing")
    end
  end
end
