class CreateCostCenters < ActiveRecord::Migration[7.1]
  def change
    create_table :cost_centers, id: :uuid do |t|
      t.string :cost_center_id
      t.string :ctrl_name
      t.string :desc
      t.string :position
      t.string :payroll_id
      t.date :valid_to
      t.uuid :purch_group_id
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
    add_index :cost_centers, :created_by_id
    add_index :cost_centers, :updated_by_id
  end
end
