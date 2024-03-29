class SourcePagesController < ApplicationController
  before_action :set_source, only: %i[index new create edit update destroy]
  before_action :set_source_page, only: %i[edit update destroy scrap]

  def index
    @source_pages = @source.source_pages.all
  end

  def new
    @source_page = SourcePage.new
  end

  def edit; end

  def update
    if @source_page.update(source_page_params)
      redirect_to source_source_pages_path, notice: 'Source page was successfully updated.', status: :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @source_page = @source.source_pages.create(source_page_params)
    if @source_page.save
      redirect_to source_source_pages_path, notice: 'Source page was successfully created.', status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to source_source_pages_path, alert: 'Deleted source page' if @source_page.destroy
  end

  def scrap
    @source_page.enqueue_scraper
  end

  private

  def source_page_params
    params.require(:source_page).permit(:name, :url, :active, :paginated, :category_id, :max_page_numbers)
  end

  def set_source
    @source = Source.find(params[:source_id])
  end

  def set_source_page
    @source_page = SourcePage.find(params[:id])
  end
end
