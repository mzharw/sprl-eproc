class CreateVendorRegistrationEntryGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :vendor_registration_entry_groups, id: :uuid do |t|
      t.uuid :vendor_registration_form_type_id
      t.uuid :parent_id
      t.string :ident_name
      t.string :name
      t.text :desc
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
