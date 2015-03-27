class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      flash[:notice] = 'Review added.'
      redirect_to restaurant_path(@review.restaurant_id)
    else
      flash[:alert] = "Review not saved, check yo length"
      redirect_to restaurant_path(@review.restaurant_id)
    end
  end

  protected

  def review_params
    params.require(:review).permit(:body)
  end
end
