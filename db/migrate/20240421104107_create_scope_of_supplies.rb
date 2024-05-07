class CreateScopeOfSupplies < ActiveRecord::Migration[7.1]
  def change
    create_table :scope_of_supplies, id: :uuid do |t|
      t.string :scope_of_supply_type
      t.uuid :parent_id
      t.string :code
      t.string :name
      t.text :desc
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.string :commodity_code
      t.string :state

      t.timestamps
    end
  end
end
