class Friend < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :city, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  def name
    if last_name.nil?
      first_name
    else
      first_name + last_name
    end
  end

end
