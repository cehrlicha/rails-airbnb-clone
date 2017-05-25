class Sale < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :friend
  has_one :rating, dependent: :destroy


end
