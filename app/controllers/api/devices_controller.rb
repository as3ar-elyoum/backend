module Api
  class DevicesController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      @device = Device.find_or_create_by(device_id: params[:device_id])
      @device.fcm_token = params[:fcm_token]
      head :no_content if @device.save
    end
  end
end
