class AddAuthorToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :created_by_id, :uuid
    add_column :roles, :updated_by_id, :uuid
  end
end
