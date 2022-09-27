class SourcePagesController < ApplicationController
  before_action :set_source, only: %i[index new create]

  def index
    @source_pages = @source.source_pages.all
  end

  def new
    @source_page = SourcePage.new
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
end
