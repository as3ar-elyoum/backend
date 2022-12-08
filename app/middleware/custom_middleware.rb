class CustomMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    @status, @headers, @response = @app.call(env)

    Rails.logger.info '-----------'
    Rails.logger.info env['HTTP_DEVICEID']
    Rails.logger.info '-----------'

    [@status, @headers, @response]
  end
end
