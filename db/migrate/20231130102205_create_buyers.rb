class CreateBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :buyers, id: :uuid do |t|
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date

      t.uuid :created_by
      t.uuid :updated_by
      t.timestamps
    end
    add_index :buyers, :created_by
    add_index :buyers, :updated_by
  end
end
