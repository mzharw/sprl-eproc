class CreatePurchReqnItemHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_item_histories do |t|
      t.references :app, null: false
      t.references :purch_reqn_item, null: false
      t.string :desc
      t.string :username
      t.boolean :system
      t.references :created_by, null: false
      t.references :updated_by, null: false
      t.references :schedule, null: false
      t.timestamp :finished_at

      t.timestamps
    end
  end
end
