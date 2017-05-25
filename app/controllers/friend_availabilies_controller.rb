class FriendAvailabiliesController < ApplicationController


  def pending
    # byebug
    @friend = Friend.find(params[:friend_id])

  end

  def booked

  end


end
