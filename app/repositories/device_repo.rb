class DeviceRepo
  def update_usage_time(device_uid)
    Device.where(device_id: device_uid).update(last_usage_time: Time.now)
  end
end
