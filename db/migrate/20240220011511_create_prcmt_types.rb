class CreatePrcmtTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :prcmt_types, id: :uuid do |t|
      t.string :ident_name
      t.string :name
      t.text :desc
      t.boolean :system
      t.string :visibility

      t.timestamps
    end
  end
end
