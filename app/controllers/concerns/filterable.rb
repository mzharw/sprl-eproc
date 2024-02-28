module Filterable
  extend ActiveSupport::Concern

  private

  # @param model CollectionProxy
  # @param map make aliases for associations type column, keeping relations hidden from the surface.
  # @example map : { plants_code: 'plants.code' }
  def filter(model, map = {})
    order_by_column = params[:sort_by]&.to_sym
    search_by_column = params[:search_by]&.to_sym
    search_by = map.key?(search_by_column) ? map[search_by_column] : params[:search_by]
    search = params[:search]&.downcase

    order_by = map.key?(order_by_column) ? map[order_by_column] : params[:sort_by]
    order_by = 'created_at' if order_by.nil?

    order_dir = params[:dir]
    order_by = order_by.split('.').length > 1 ? order_by : "#{model.table_name}.#{order_by}"
    # OpenStruct.new({ order_by:, order_dir:, search:, search_by: })

    model = model.where("lower(#{search_by}) LIKE ?", "%#{search}%") if params.key? :search_by
    model.order("#{order_by} #{order_dir || 'DESC'}")
  end

  def selectable(model, *columns, **options)
    query = params[:query]
    model = model.where("LOWER(#{columns.join(" || ' - ' || ")})  ~* ?", "#{query.downcase}") if query

    # options handler
    ## filter options
    filters = options[:filter]
    filters = [filters] if filters.is_a? String

    unless filters.nil?
      filters.each do |k|
        value = params[k]
        model = model.where(k => value) unless value.nil?
      end
    end

    model
  end

  def paginate(collection)
    collection.page(params[:page])
  end

  def paginate_json(collection)
    id = params[:id]
    paginated = id ? collection.where(id:) : collection
    paginated = paginate(paginated)
    {
      data: paginated,
      pagination: {
        current_page: params[:page] || 1,
        page_counts: paginated.total_pages,
        total_counts: collection.count
      }
    }
  end
end
