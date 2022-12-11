class CustomMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    DeviceRepo.new.update_usage_time(env['HTTP_DEVICEID'])
    @app.call(env)
  end
end
