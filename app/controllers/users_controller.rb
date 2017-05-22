class UsersController < ApplicationController
  def show
    @friends = Friend.all
    @user = User.find(params[:id])
  end
end
