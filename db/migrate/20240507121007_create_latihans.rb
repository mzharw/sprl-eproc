class CreateLatihans < ActiveRecord::Migration[7.1]
  def change
    create_table :latihans, id: :uuid do |t|
      t.string :text

      t.timestamps
    end
  end
end
