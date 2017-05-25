class Rating < ApplicationRecord
  validates :buyer_rating, presence: true
  validates :seller_rating, presence: true
  belongs_to :sale
end
