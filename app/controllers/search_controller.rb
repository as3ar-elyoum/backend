class SearchController < ApplicationController
  def index
    @products = Products::Search.new(params[:query][:q]).perform
  end
end
