class CustomMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, response]

    device = Device.find_by(device_id: env['HTTP_DEVICEID'])
    device.update(last_usage_time: Time.now)
  end
end
