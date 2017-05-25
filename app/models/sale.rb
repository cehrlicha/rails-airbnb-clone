class Sale < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :friend
  has_one :rating, dependent: :destroy


  validates :start_daytime, presence: true
  validates :end_daytime, presence: true
  validates :buyer, presence: true
  validates :friend, presence: true

end
