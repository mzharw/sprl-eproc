class CreateCostCenters < ActiveRecord::Migration[7.1]
  def change
    create_table :cost_centers do |t|
      t.string :cost_center_id
      t.string :ctrl_name
      t.text :desc
      t.string :position
      t.string :payroll_id
      t.date :valid_to
      t.uuid :created_by
      t.uuid :updated_by
      t.uuid :purch_group_id

      t.timestamps
    end
  end
end
