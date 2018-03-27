class Api::V1::RestaurantsController < ApiController

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

end
