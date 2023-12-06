class CreateProductGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :product_groups, id: :uuid do |t|
      t.uuid :app_id
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.text :desc
      t.uuid :created_by
      t.uuid :updated_by

      t.timestamps
    end
    add_index :product_groups, :created_by
    add_index :product_groups, :updated_by
  end
end
