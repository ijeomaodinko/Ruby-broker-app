class Product < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :price, presence: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => { :greater_than => 0, :less_than => 10000000 }
  validates :description, presence: true, length: {minimum: 2, maximum: 1000}
  validates :img, presence: true

  has_many :orders, dependent: :destroy

  belongs_to :category
  belongs_to :company
  has_many :reviews
end
