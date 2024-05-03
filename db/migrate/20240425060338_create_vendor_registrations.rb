class CreateVendorRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :vendor_registrations, id: :uuid do |t|
      t.string :number
      t.uuid :vendor_id
      t.uuid :purch_org_id
      t.string :state
      t.uuid :vendor_type_id
      t.uuid :unit_internal_org_id
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
