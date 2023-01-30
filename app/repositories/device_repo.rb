class DeviceRepo
  def update_usage_time(token)
    Device.where(fcm_token: token).update(last_usage_time: Time.now)
  end
end
