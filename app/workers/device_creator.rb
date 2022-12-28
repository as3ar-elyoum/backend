class DeviceCreator
  include Sidekiq::Worker
  sidekiq_options queue: :low_priority, retry: 1

  def perform(device_uid)
    DeviceRepo.new.update_usage_time(device_uid)
  end
end
