module Filterable
  extend ActiveSupport::Concern

  private

  # @param model CollectionProxy
  # @param map make aliases for associations type column, keeping relations hidden from the surface.
  # @example map : { plants_code: 'plants.code' }
  def filter(model, map = {}, order_by = nil, order_dir = nil)
    order_by_column = params[:sort_by]&.to_sym
    search_by_column = params[:search_by]&.to_sym
    search_by = map.key?(search_by_column) ? map[search_by_column] : params[:search_by]
    search = params[:search]&.downcase

    order_by = order_by_column.nil? ? order_by : (map.key?(order_by_column) ? map[order_by_column] : params[:sort_by])
    order_by = 'created_at' if order_by.nil?

    order_dir = params[:dir] || order_dir
    order_by = (order_by.split('.').length > 1 ? order_by : "#{model.table_name}.#{order_by}") unless order_by_column.nil?
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
    filters = params[:filters] if filters.nil?

    filter_map = options[:filter_map] || nil

    filters&.each do |k, v|
      value = v.nil? ? params[k] : v
      key = filter_map.nil? ? k : filter_map[k.to_sym]

      model = model.where(key => value) unless value.nil?
    end

    model
  end

  def paginate(collection)
    paged = collection.page(params[:page])

    if params[:per].present?
      paged = params[:per] == 'all' ? paged.per(collection.count) : paged.per(params[:per])
    end

    paged
  end

  def paginate_json(collection, *select)
    id = params[:id]
    paginated = id ? collection.where(id:) : collection
    paginated = paginated.select(*select) unless select.empty?

    paginated
    # paginated = paginate(paginated)

    # begin
    #   total_counts = collection.count
    # rescue
    #   total_counts = collection.length
    # end
    #
    # unless total_counts.is_a?(Integer)
    #   total_counts = total_counts.length
    # end
    #
    # {
    #   data: paginated,
    #   pagination: {
    #     current_page: params[:page] || 1,
    #     page_counts: paginated.total_pages,
    #     total_counts:
    #   }
    # }

  end
end
