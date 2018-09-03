class Admin::CategoriesController < ApplicationController
  before_action :correct_category,   only: [:show, :edit, :update, :destroy]
  def new
    @category = Category.new
  end
  def index
    @categories = Category.paginate(page: params[:page])
  end
  def create
     @category = Category.new(category_params)
    if @category.save 
      flash[:success] = "Create Category"
      redirect_to admin_categories_path
    else
      render "new"
    end  
  end
  def show
  end

  def edit
  end
  
  def update
      if @category.update_attributes(category_params);
        flash[:success] = "Updated uccessfully"
        redirect_to admin_categories_path
      else
        render 'edit'
      end    
  end

  def destroy
    @category.destroy
    flash[:info] = "Deleted category successfully."
    redirect_to request.referrer || root_url
    
  end

  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    def category_params
      params.require(:category).permit(:title,:description)
    end
    def correct_category
      @category = Category.find(params[:id])
    end
end
