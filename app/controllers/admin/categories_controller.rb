class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to admin_categories_path
    else
      @categories = Categories.all
      render :index
    end  
  end

  private
  
    def authenticate_admin
      unless current_user.admin?
        flash[:alert] = "NOT ALLOW!"
        redirect_to root_path
      end  
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
