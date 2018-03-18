class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @commented_restaurants = @user.restaurants.uniq
  end

  def edit
  end

  def update
    @user.update(user_params)
    flash[:notice] = "User profile was successfully updated"
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :intro, :avatar)
  end

  def set_user
    begin
      if current_user == User.find(params[:id])
        @user = User.find(params[:id])
      else
        flash[:alert] = "NOT ALLOW!"
        redirect_to user_path(current_user)
      end 
    rescue
      redirect_to user_path(current_user)
    end   
  end

end