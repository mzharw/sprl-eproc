class AddSystemToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :system, :boolean, default: false
  end
end
