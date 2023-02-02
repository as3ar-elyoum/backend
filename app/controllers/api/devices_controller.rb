module Api
  class DevicesController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      @device = Device.find_or_create_by(fcm_token: params[:fcm_token])
      @device.fcm_token = params[:fcm_token]
      render json: @device, status: :created if @device.save
    end
  end
end
