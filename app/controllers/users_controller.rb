class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = @user.friends
    @rating = Rating.new

  end

  def name
    if last_name.nil?
      first_name
    else
      first_name + " " + last_name
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
end


  private

def user_params
  params.require(:user).permit(:first_name, :last_name, :username, :phone_number)
end
