class FriendAvailability < ApplicationRecord
  belongs_to :friend

  def self.pending(date, friend, buyer)
      @availabilities = FriendAvailability.where(:friend_id => friend.id)
      @availabilities.each do |av|
        byebug
        if DateTime.parse(date) >= av.start_daytime && DateTime.parse(date) <= av.end_daytime && (av.booked != 1 || av.booked != nil) && (av.pending != 1 || av.pending != nil)

          # av.pending = 1
          av.update(pending: 1, buyer_id: buyer)

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

   def self.booked(friend, buyer)
    @availabilities = FriendAvailability.where(:friend_id => friend.id)

    @availabilities.each do |av|
        if av.pending == true
          av.update(pending: false, booked: true)
          @sale = Sale.create(
            start_daytime: av.start_daytime,
            end_daytime: av.end_daytime,
            friend: friend,
            buyer: buyer)
      end
    # if owner clicks confirm
    # find availability
    # change pending to 0
    # change booked to 1
    end
    end

  end

