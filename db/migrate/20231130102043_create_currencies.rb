class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies, id: :uuid do |t|
      t.uuid :app_id
      t.string :code
      t.string :name
      t.string :symbol
      t.text :desc

      t.timestamps
    end
  end
end
