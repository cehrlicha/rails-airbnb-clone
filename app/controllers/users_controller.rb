class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = @user.friends
    @rating = Rating.new

    @date = params[:date]
    @booked_friend = Friend.find(params[:friend_id])
  end

  def name
    if last_name.nil?
      first_name
    else
      first_name + " " + last_name
    end
  end
end
