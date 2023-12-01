class CreatePurchReqnLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_links do |t|
      t.references :app, null: false
      t.references :purch_reqn_link_type, null: false
      t.references :from_purch_reqn, null: false
      t.references :to_purch_reqn, null: false
      t.string :desc

      t.timestamps
    end
  end
end
