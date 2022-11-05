module Api
  class DevicesController < ApplicationController
    protect_from_forgery with: :null_session

    def new
      @device = Device.new
    end

    def create
      @device = Device.find_or_create_by(:device_id => params[:device_id])
      @device.token = params[:token]
      if @device.save
        redirect_to root_path
      end
    end
  end
end
