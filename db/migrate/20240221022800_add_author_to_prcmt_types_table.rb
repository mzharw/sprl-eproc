class AddAuthorToPrcmtTypesTable < ActiveRecord::Migration[7.1]
  def change
    add_column :prcmt_types, :created_by_id, :uuid
    add_column :prcmt_types, :updated_by_id, :uuid
  end
end
