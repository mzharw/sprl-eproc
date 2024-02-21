class CreatePersonnels < ActiveRecord::Migration[7.1]
  def change
    create_table :personnels, id: :uuid do |t|
      t.uuid :party_id
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.string :position_name
      t.uuid :unit_internal_org_id
      t.string :number
      t.boolean :is_section_head

      t.timestamps
    end
  end
end
