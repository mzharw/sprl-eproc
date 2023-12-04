class CreatePurchReqnLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_links, id: :uuid  do |t|
      t.uuid :purch_reqn_link_type, null: false
      t.uuid :from_purch_reqn, null: false
      t.uuid :to_purch_reqn, null: false
      t.string :desc

      t.timestamps
    end
  end
end
