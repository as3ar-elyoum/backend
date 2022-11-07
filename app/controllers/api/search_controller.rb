module Api
  class SearchController < ApplicationController
    def index
      @products = Products::Search.perform(params[:query])
    end
  end
end
