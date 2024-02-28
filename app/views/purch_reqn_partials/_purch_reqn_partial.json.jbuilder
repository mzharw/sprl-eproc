json.extract! purch_reqn_partial, :id, :purch_reqn_item_id, :partialable_type, :partialable_id, :partial_itemable_type, :partial_itemable_id, :qty, :data, :state, :created_by_id, :updated_by_id, :created_at, :updated_at
json.url purch_reqn_partial_url(purch_reqn_partial, format: :json)
