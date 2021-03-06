class FriendsController < ApplicationController

  def index
    @friends = Friend.all

  end

  def show
    @friend = Friend.find(params[:id])
    @user = User.find(params[:user_id])
    @available = FriendAvailability.new



    @hash = Gmaps4rails.build_markers(@friend) do |friend, marker|
      marker.lat friend.latitude
      marker.lng friend.longitude
    end
  end

  def product
    # byebug
    @friend = Friend.find(params[:id])
    @date = params[:date]
    @average_rating = @friend.average_friend_rating
    @sale = Sale.new

    @hash = Gmaps4rails.build_markers(@friend) do |friend, marker|
      marker.lat friend.latitude
      marker.lng friend.longitude
    end
  end

  def new
    @friend = Friend.new
    @user = User.find(params[:user_id])

  end

  def create

    @friend = Friend.new(friend_params)

    if @friend.save
      redirect_to user_path(@friend.user)
    else
      render 'new'
    end

  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    redirect_to user_path(@friend.user)
  end

  def edit
    @friend = Friend.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @friend = Friend.find(params[:id])
    @user = User.find(params[:user_id])
    new_params = friend_params
    new_params.delete("photo_cache") if new_params["photo_cache"].blank?
    new_params.delete("photo") if new_params["photo"].blank?

    @friend.update(new_params)

    if @friend.save
      redirect_to user_path(@friend.user)
    else
      render 'edit'
    end
  end

  private
  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :age, :description, :price, :gender, :city, :user_id, :photo, :address, :photo_cache)
  end


end
