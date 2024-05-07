class CreateVendorRegistrationEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :vendor_registration_entries, id: :uuid do |t|
      t.uuid :vendor_registration_id
      t.uuid :vendor_registration_form_id
      t.uuid :vendor_registration_entry_group_id
      t.uuid :ident_uuid
      t.uuid :approved_by_id
      t.uuid :rejected_by_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :entryable_id
      t.string :entry_type
      t.string :plurality
      t.string :entryable_type
      t.text :comment
      t.json :data
      t.timestamp :approved_at
      t.timestamp :rejected_at

      t.timestamps
    end
  end
end
