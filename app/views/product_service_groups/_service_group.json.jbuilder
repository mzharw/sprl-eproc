json.extract! product_group, :id, :code, :name, :desc, :created_by_id, :updated_by_id, :created_at, :updated_at
json.url service_group_url(product_group, format: :json)
