class CreateParties < ActiveRecord::Migration[7.1]
  def change
    create_table :parties, id: :uuid do |t|
      t.string :party_type
      t.string :full_name
      t.jsonb :data
      
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamp :discarded_at
      t.timestamps null: true
    end

    add_index :parties, :party_type
    add_index :parties, :discarded_at
    add_index :parties, :created_by_id
    add_index :parties, :updated_by_id
  end
end
