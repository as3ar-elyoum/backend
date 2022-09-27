class SourcesController < ApplicationController

    before_action :set_source, only: [:show, :edit, :update]

    def index
        @sources = Source.all
    end

    def show; end

    def new
        @source = Source.new
    end

    def create
        @source = Source.new(source_params)
        redirect_to root_path if @source.save
    end

    def edit; end

    def update
        redirect_to root_path if @source.update(source_params)
    end

    private

    def source_params
        params.require(:source).permit(:name, :url, :url_prefix, :active)
    end

    def set_source
        @source = Source.find(params[:id])
    end
end
