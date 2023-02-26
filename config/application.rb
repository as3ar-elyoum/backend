require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
require_relative '../app/middleware/custom_middleware'

module As3arElyoumBackend
  class Application < Rails::Application
    config.load_defaults 7.0
    config.middleware.use CustomMiddleware
    config.public_file_server.enabled = true

    config.api_only = false
  end
end
