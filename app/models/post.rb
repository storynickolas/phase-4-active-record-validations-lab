class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {  maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait

  def clickbait
    if title
      unless title.include? "Won't Believe" || "Secret" || "Top" || "Guess"
        errors.add(:title, "Not sufficiently Clickbait-y")
      end
    end
  end
end
