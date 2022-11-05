module Api
  class DevicesController < ApplicationController
    protect_from_forgery with: :null_session
    
    def index
      @devices = Device.all
    end

    def new
      @device = Device.new
    end

    def create
      @device = Device.new(device_params)
      if @device.save
        redirect_to root_path, notice: "Device was successfully created."
      end
    end

    def device_params
      params.require(:device).permit(:device_id, :user_token)
    end
  end
end
