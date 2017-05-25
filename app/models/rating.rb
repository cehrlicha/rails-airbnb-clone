class Rating < ApplicationRecord
  validates :buyer_rating, presence: true
  belongs_to :sale
end
