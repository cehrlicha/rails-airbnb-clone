class FriendsController < ApplicationController

  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])

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
  end

  def edit
    @friend = Friend.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @friend = Friend.find(params[:id])

    @friend.update(friend_params)

    if @friend.save
      redirect_to user_path(@friend.user)
    else
      render 'new'
    end
  end

  private
  def friend_params
    params.require(:friend).permit(:name, :age, :description, :gender, :city, :user_id, :photo, :photo_cache)
  end


end
