class FriendsController < ApplicationController

  def index
    @friends = Friend.all
  end

  def show

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
  end

  def edit

  end

  def update

  end

  private
  def friend_params
    params.require(:friend).permit(:name, :age, :description, :gender, :city, :user_id, :photo, :photo_cache)
  end


end
