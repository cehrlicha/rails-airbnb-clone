class RatingsController < ApplicationController
  def create
    @sale = Sale.find(rating_params[:sale_id])
    @rating = Rating.new(rating_params)
    @rating.sale = @sale

    if @rating.save
      redirect_to friend_path(@rating.sale.friend)
    else
      render 'new'
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:buyer_rating, :buyer_review, :sale_id)
  end
end
