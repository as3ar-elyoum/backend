class SourcesController < ApplicationController
  before_action :set_source, only: %i[show edit update scrap]

  def index
    @sources = Source.all
  end

  def show; end

  def new
    @source = Source.new
    @source.build_source_config
  end

  def create
    @source = Source.new(source_params)
    if @source.save
      redirect_to root_path, notice: 'Source was successfully created.', status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @source.update(source_params)
      redirect_to root_path, status: :ok
    else
      render :edit, status: :unprocessable_entity, notice: 'Source was not updated.'
    end
  end

  def scrap
    @source.enqueue_scraper
  end

  private

  def source_params
    params.require(:source).permit(:name, :url, :url_prefix, :active,
                                   source_config_attributes:
                                   %i[name_selector price_selector image_url_selector description_selector products_url_selector])
  end

  def set_source
    @source = Source.find(params[:id])
  end
end
