class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :code
      t.string :name
      t.string :symbol
      t.text :desc
      t.uuid :created_by
      t.uuid :updated_by

      t.timestamps
    end
    add_index :currencies, :created_by
    add_index :currencies, :updated_by
  end
end
