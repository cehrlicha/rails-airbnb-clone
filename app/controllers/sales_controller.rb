class SalesController < ApplicationController

  def new
    # byebug
    @friend = Friend.find(params[:friend_id])
    @date = params[:date]
  end
  def create
    @date = params[:date]
    @friend = Friend.find(params[:friend_id])

    @sale = Sale.new(
      start_daytime: @date,
      end_daytime: @date,
      friend: @friend,
      buyer: current_user)

    if @sale.save
    else

    end
  end
end
