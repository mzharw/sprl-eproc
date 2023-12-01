class CreateBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :buyers do |t|
      t.uuid :app_id
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date


      t.timestamps
    end
  end
end
