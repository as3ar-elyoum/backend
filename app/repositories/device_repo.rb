class DeviceRepo
  def update_usage_time(token)
    @device = Device.find_or_create_by(fcm_token: token)
    @device.update(last_usage_time: Time.now)
  end
end
