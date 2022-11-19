class ProductFacade
  def initialize(params)
    @params = params
  end

  def perform
    @product_query = Product.active.includes(:source, :category).order('RANDOM()')
    apply_query_filter
    @product_query.limit(100)
  end

  def apply_query_filter
    return {} unless @params[:filter]

    filter_keys = @params[:filter]&.keys || []

    filter_keys.each do |key|
      if @params[:filter][key.to_sym].present?
        @product_query = @product_query.where(key.to_sym => @params[:filter][key.to_sym])
      end
    end
  end
end
