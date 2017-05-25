class Friend < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  has_many :sales, dependent: :destroy
  has_many :friend_availabilities, dependent: :destroy

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
      date = DateTime.parse(search["date"])
      results = []

      results << where("city LIKE ? AND gender = ? AND age = ?", "%"+search["city"]+"%", search["gender"], search["age"].to_i)
        # byebug
      # results << joins(:friend_availabilities).where("start_daytime <= ? AND end_daytime >= ?", date, date )

      results.flatten.uniq
  end

end

# city age gender
