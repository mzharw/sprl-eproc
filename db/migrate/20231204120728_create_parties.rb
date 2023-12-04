class CreateParties < ActiveRecord::Migration[7.1]
  def change
    create_table :parties do |t|
      t.string :party_type
      t.string :full_name
      t.jsonb :data
      
      t.uuid :created_by
      t.uuid :updated_by
      t.datetime :discarded_at
      t.timestamps
    end

    add_index :parties, :party_type
    add_index :parties, :discarded_at
  end
end
