require 'sidekiq'
require 'sidekiq/web'

schedule_file = 'config/schedule.yml'

Sidekiq::Cron::Job.all.clear

Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
  config.logger.level = Logger::ERROR
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }

  Rails.application.config.after_initialize do
  end
end
