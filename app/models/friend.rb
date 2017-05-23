class Friend < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :city, presence: true

  mount_uploader :photo, PhotoUploader

  def name
    first_name + last_name
  end

end
