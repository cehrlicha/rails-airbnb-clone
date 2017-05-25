class FriendAvailability < ApplicationRecord
  belongs_to :friend

  def self.pending(date, friend)

      @availabilities = FriendAvailability.where(:friend_id => friend.id)
      @availabilities.each do |av|
        if Time.parse(date) > av.start_daytime && Time.parse(date) < av.end_daytime && av.booked != 1 && av.pending != 1
          av.pending = 1
          av.update

      else
        return "already book"
      end
    # check availabilities of friend with friend param
    # loop through availablities
    # check if date is in intervall
    # if yes && booked == 0 && pending == 0
    # pending = 1
    # ask for confirmatio from owner
    # else
    # already booked
    end
  end

   def self.booked(date, friend)
    # if owner clicks confirm
    # find availability
    # change pending to 0
    # change booked to 1
  end
end

