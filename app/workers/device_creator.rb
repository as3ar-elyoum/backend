class DeviceCreator
  include Sidekiq::Worker
  sidekiq_options queue: :low_priority, retry: 1

  def perform(token)
    DeviceRepo.new.update_usage_time(token)
  end
end
