class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product


  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :review_text, presence: true

end
