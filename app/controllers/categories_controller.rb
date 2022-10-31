class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    redirect_to categories_path if @category.save!
  end

  def edit; end

  def update
    redirect_to categories_path if @category.update(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
