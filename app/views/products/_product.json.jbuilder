json.extract! product, :id, :product_type, :product_group_id, :code, :name, :measurement_unit_id, :created_at, :updated_at, :created_by_id, :updated_by_id, :desc, :created_at, :updated_at
json.url product_url(product, format: :json)
