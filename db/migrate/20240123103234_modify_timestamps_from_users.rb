class ModifyTimestampsFromUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:users, :created_at, false)
    change_column_null(:users, :updated_at, false)
  end
end
