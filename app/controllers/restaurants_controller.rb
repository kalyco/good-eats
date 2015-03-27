class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @reviews = Review.where(restaurant_id: @restaurant.id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'You have added a new restaurant!'
      redirect_to @restaurant
    else
      flash[:alert] = "Restaurant not added!"
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  protected

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode,
    :description, :category)
  end
end
