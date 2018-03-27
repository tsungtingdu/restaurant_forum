class Api::V1::RestaurantsController < ApiController

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: {
        message: "New restaurant has been created successfully",
        result: @restaurant
      }
    else
      render json: {
        message: "Error",
        errors: @restaurant.errors
      }
    end 
  end

  private

  def restaurant_params
    params.permit(:name, :tel, :address, :opening_hours, :description)
  end
end
