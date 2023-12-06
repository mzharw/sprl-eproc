class CreatePurchReqnItemHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_item_histories, id: :uuid do |t|
      t.uuid :purch_reqn_item, null: false
      t.string :desc
      t.string :username
      t.boolean :system
      t.uuid :schedule, null: false
      t.timestamp :finished_at
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false

      t.timestamps
    end
    add_index :purch_reqn_item_histories, :created_by
    add_index :purch_reqn_item_histories, :updated_by
  end
end
