class AddAuthorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :created_by_id, :uuid
    add_column :users, :updated_by_id, :uuid
  end
end
