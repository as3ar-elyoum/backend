class ProductFacade
  def initialize(params)
    @params = params
  end

  def perform
    @product_query = Product.includes(:source, :category).order('RANDOM()')
    apply_query_filter
    @product_query.limit(300)
  end

  def apply_query_filter
    return {} unless @params[:filter]

    filter = @params[:filter]

    @product_query = @product_query.where(category_id: filter[:category_id]) if filter[:category_id]
  end
end