class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :create_review]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_permitted)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # using foreign models
  # def review
  #   @review = Review.new(params_permitted_review)
  #   @review.restaurant = @restaurant
  #   # @review.restaurant_id = params[:restaurant_id].to_i
  #   if @review.save
  #     redirect_to restaurant_path(@restaurants)
  #   else
  #     render :show
  #   end
  # end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_permitted
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  # def params_permitted_review
  #   params.require(:review).permit(:content, :rating)
  # end
end
