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
    params.require(:friend).permit(:first_name, :last_name, :age, :description, :gender, :city, :user_id, :photo, :photo_cache)
  end


end
