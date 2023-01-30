module Api
  class DevicesController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      @device = Device.find_or_create_by(:fcm_token => params[:fcm_token])
      @device.fcm_token = params[:fcm_token]
      if @device.save
        render json: @device, status: :created
      end
    end
  end
end
