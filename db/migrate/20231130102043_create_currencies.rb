class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :code
      t.string :name
      t.string :symbol
      t.text :desc
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
    add_index :currencies, :created_by_id
    add_index :currencies, :updated_by_id
  end
end
