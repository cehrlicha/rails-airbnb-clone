class FriendAvailabiliesController < ApplicationController

  def pending
    @date = params[:date]
    @booked_friend = Friend.find(params[:friend_id])
    @buyer = params[:buyer]
    FriendAvailability.pending(@date, @booked_friend, @buyer)

    redirect_to current_user
  end

  def booked
    byebug
    @booked_friend = Friend.find(params[:friend_id])
    @buyer = User.find(params[:buyer_id])
    FriendAvailability.booked(@booked_friend, @buyer)
    redirect_to current_user
  end
end
