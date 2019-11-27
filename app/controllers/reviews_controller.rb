class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_permitted)
    @review.restaurant = @restaurant
    # @review.restaurant_id = params[:restaurant_id].to_i
    if @review.save
      redirect_to restaurant_path(Restaurant.find(params[:restaurant_id]))
    else
      render :new
    end
  end

  private

  def params_permitted
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
