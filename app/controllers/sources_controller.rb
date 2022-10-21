class SourcesController < ApplicationController
  before_action :set_source, only: %i[show edit update scrap]

  def index
    @sources = Source.all
  end

  def show; end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)
    if @source.save
      redirect_to root_path, notice: 'Source was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    redirect_to root_path if @source.update(source_params)
  end

  def scrap
    @source.enqueue_scraper
  end

  private

  def source_params
    params.require(:source).permit(:name, :url, :url_prefix, :selectors, :active)
  end

  def set_source
    @source = Source.find(params[:id])
  end
end
