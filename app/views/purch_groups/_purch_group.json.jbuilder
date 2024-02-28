json.extract! purch_group, :id, :purch_order_type_id, :number, :issued_date, :name
json.url purch_group_url(purch_group, format: :json)
