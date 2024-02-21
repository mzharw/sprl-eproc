class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, id: :uuid do |t|
      t.uuid :user_id
      t.string :number
      t.string :name
      t.uuid :taskable_id
      t.string :taskable_type
      t.json :data
      t.string :state
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
