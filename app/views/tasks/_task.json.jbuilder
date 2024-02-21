json.extract! task, :id, :id, :user_id, :number, :name, :taskable_id, :taskable_type, :data, :state, :created_by_id, :updated_by_id, :created_at, :updated_at
json.url task_url(task, format: :json)
