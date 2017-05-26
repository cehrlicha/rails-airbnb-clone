class Rating < ApplicationRecord
  validates :buyer_rating, presence: true
  belongs_to :sale

  def average_person_rating(person)
    rating_sum = 0
    rating_count = 0
    person.sales.each do |sale|
      sale.ratings.each do |rating|
        rating_sum += rating
        rating_count += 1
      end
    end
  return rating_sum / rating_count
  end


end
