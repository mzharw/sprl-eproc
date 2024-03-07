class AddAuthorToUserRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :users_roles, :created_by_id, :uuid
    add_column :users_roles, :updated_by_id, :uuid
    add_timestamps :users_roles, null: true
  end
end
