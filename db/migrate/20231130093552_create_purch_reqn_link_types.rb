class CreatePurchReqnLinkTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_link_types do |t|
      t.references :app, null: false
      t.string :ident_name
      t.string :name
      t.text :desc
      t.boolean :system
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps
    end
  end
end
