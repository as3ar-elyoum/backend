class ProductFacade
  def initialize(params)
    @params = params
  end

  def perform
    @product_query = Product.includes(:source, :category).order('RANDOM()')
    apply_query_filter
    @product_query.limit(100)
  end

  def apply_query_filter
    return {} unless @params[:filter]

    filter_keys = @params[:filter]&.keys || []

    # @product_query = @product_query.where(category_id: filter[:category_id]) if filter[:category_id].present?
    # @product_query = @product_query.where(status: filter[:status]) if filter[:status].present?

    filter_keys.each do |key|
      if @params[:filter][key.to_sym].present?
        @product_query = @product_query.where(key.to_sym => @params[:filter][key.to_sym])
      end
    end
  end
end
