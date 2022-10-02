class SourcePagesController < ApplicationController
  before_action :set_source, only: %i[index new create edit update]
  before_action :set_source_page, only: %i[edit update]

  def index
    @source_pages = @source.source_pages.all
  end

  def new
    @source_page = SourcePage.new
  end

  def edit; end

  def update
    @source_page.update(source_page_params)
  end

  def create
    @source_page = @source.source_pages.create(source_page_params)
    redirect_to source_path(@source)
  end

  private

  def source_page_params
    params.require(:source_page).permit(:name, :url, :active, :selectors)
  end

  def set_source
    @source = Source.find(params[:source_id])
  end

  def set_source_page
    @source_page = SourcePage.find(params[:id])
  end
end