module Api
  class CategoriesController < ApplicationController
    def index
      @categories = Category.active.all
    end
  end
end
