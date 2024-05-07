class CreateVendorScopeOfSupplies < ActiveRecord::Migration[7.1]
  def change
    create_table :vendor_scope_of_supplies, id: :uuid do |t|
      t.uuid :vendor_id
      t.uuid :scope_of_supply_id
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.text :desc

      t.timestamps
    end
  end
end
