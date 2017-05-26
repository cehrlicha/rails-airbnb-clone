class FriendAvailabiliesController < ApplicationController

  def pending
    @date = params[:date]
    @booked_friend = Friend.find(params[:friend_id])
    FriendAvailability.pending(@date, @booked_friend)
    redirect_to current_user
  end
end
