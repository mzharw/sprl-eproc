class CreateVendors < ActiveRecord::Migration[7.1]
  def change
    create_table :vendors, id: :uuid do |t|
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :active_vendor_status_id
      t.jsonb :data
      t.uuid :vendor_type_id
      t.string :state

      t.timestamps
    end
  end
end
