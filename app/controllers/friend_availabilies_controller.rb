class FriendAvailabiliesController < ApplicationController

  def pending
    @date = params[:date]
    @booked_friend = Friend.find(params[:friend_id])
    @buyer = params[:buyer]
    FriendAvailability.pending(@date, @booked_friend, @buyer)

    redirect_to current_user
  end

  def booked
    @booked_friend = Friend.find(params[:friend_id])
    @buyer = User.find(params[:buyer_id])
    FriendAvailability.booked(@booked_friend, @buyer)
    redirect_to current_user
  end

  def create
    available = FriendAvailability.new()
    available.start_daytime = DateTime.new(
      params[:friend_availability]["start_daytime(1i)"].to_i,
     params[:friend_availability]["start_daytime(2i)"].to_i,
      params[:friend_availability]["start_daytime(3i)"].to_i)

    available.end_daytime = DateTime.new(
      params[:friend_availability]["start_daytime(1i)"].to_i,
      params[:friend_availability]["start_daytime(2i)"].to_i,
      params[:friend_availability]["start_daytime(3i)"].to_i)

    available.booked = false
    available.pending = false

    available.friend = Friend.find(params[:friend_availability]["friend_id"])

    available.save

    redirect_to user_friend_path(params[:friend_availability]["user_id"],params[:friend_availability]["friend_id"])
  end

  def destroy

  end
end
