class Admin::RestaurantsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'A new restaurant was successfully created'
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = 'A new restaurant was failed to be created'
      render :new
    end  
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = 'A new restaurant was successfully updated'
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = 'A new restaurant was failed to be updated'
      render :edit
    end  
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "The restaurant was successfully deleted"
  end

  private

    def authenticate_admin
      unless current_user.admin?
        flash[:alert] = "NOT ALLOW!"
        redirect_to root_path
      end  
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :tel, :address, :opening_hours,  :description)
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
