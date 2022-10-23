require_relative 'boot'

require 'rails/all'

Dir[File.expand_path('app/events/*.rb')].sort.map do |file|
  require file
end

Dir[File.expand_path('app/handlers/*.rb')].sort.map do |file|
  require file
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module As3arElyoumBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.autoload_paths << Rails.root.join('app/events/*.rb')
  end
end
