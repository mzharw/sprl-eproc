class CreateWorkflows < ActiveRecord::Migration[7.1]
  def change
    create_table :workflows, id: :uuid do |t|
      t.string :name
      t.string :state, default: 'ACTIVE'
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamp :discarded_at
      t.uuid :discarded_by_id

      t.timestamps
    end
  end
end
