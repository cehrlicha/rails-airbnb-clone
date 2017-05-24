class Friend < ApplicationRecord
  belongs_to :user
  has_many :sales, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :city, presence: true
  # validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  def name
    if last_name.nil?
      first_name
    else
      first_name + " " + last_name
    end
  end

  def self.search(search)
      where("city LIKE ? AND gender = ? AND age = ?", "%"+search["city"]+"%", search["gender"], search["age"].to_i)

  end

end

# city age gender
