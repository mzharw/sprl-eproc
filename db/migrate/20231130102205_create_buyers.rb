class CreateBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :buyers, id: :uuid do |t|
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date

      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index :buyers, :created_by_id
    add_index :buyers, :updated_by_id
  end
end
