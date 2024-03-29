class CustomMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    result = @app.call(env)
    @env = env
    @request_info = @env['action_dispatch.request.path_parameters']

    enqueu_logging_worker
    result
  end

  private

  def enqueu_logging_worker
    return if @env['HTTP_FCMTOKEN'].nil?

    DeviceCreator.perform_async(@env['HTTP_FCMTOKEN'])
    enqueue_product_hit_logger
  end

  def enqueue_product_hit_logger
    return unless show_product?

    product_id = @request_info[:id].to_i
    ProductHitLogger.perform_in(1.minute, product_id, @env['HTTP_FCMTOKEN'])
  end

  def show_product?
    # { format: :json, controller: 'api/products', action: 'show', id: '1' }
    return false unless @request_info[:controller] == 'api/products'
    return false unless @request_info[:format].to_sym == :json
    return false unless @request_info[:action].to_sym == :show
    return false unless @request_info[:id].to_i.is_a? Integer

    true
  end
end
