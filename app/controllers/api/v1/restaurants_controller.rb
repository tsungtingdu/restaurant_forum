class Api::V1::RestaurantsController < ApiController

  def index
    @restaurants = Restaurant.all
    # render json: @restaurants
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

  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.update(restaurant_params)
      render json: {
        message: "Restaurant has been updated successfully!",
        result: @restaurant
      }
    else
      render json: {
        errors: @restaurant.errors
      }
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.destroy
      render json: {
        message: "Restaurant has been destroyed successfully!",
    }

  end

  private

  def restaurant_params
    params.permit(:name, :tel, :address, :opening_hours, :description)
  end
end
