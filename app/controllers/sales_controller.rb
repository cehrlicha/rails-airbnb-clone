class SalesController < ApplicationController

  def new
    @friend = Friend.find(params[:sale][:friend_id])
    @date = params[:sale][:date]
  end

  def create
    @date = params[:date]
    @friend = Friend.find(params[:friend_id])

    @sale = Sale.new(
      start_daytime: @date,
      end_daytime: @date,
      location: "Portugal",
      friend: @friend,
      buyer: current_user)
  end

end
