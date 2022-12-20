class DevicesController < ApplicationController
  def index
    @devices = Device.order(last_usage_time: :desc).limit(200)
  end
end
