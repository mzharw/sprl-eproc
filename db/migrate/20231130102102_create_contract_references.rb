class CreateContractReferences < ActiveRecord::Migration[7.1]
  def change
    create_table :contract_references, id: :uuid do |t|
      t.uuid :contact_type_id
      t.string :number
      t.uuid :country_id
      t.string :other_country
      t.uuid :province_id
      t.string :other_province
      t.uuid :district_id
      t.string :other_district
      t.uuid :sub_district_id
      t.string :other_sub_district
      t.uuid :village_id
      t.string :other_village
      t.text :postal_address
      t.string :electronic_address

      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.string :area_code
      t.string :ext
      t.string :postal_code

      t.timestamps
    end
    add_index :contract_references, :created_by_id
    add_index :contract_references, :updated_by_id
  end
end
