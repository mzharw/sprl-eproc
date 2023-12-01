class CreateCostCenters < ActiveRecord::Migration[7.1]
  def change
    create_table :cost_centers do |t|
      t.uuid :app_id
      t.string :cost_center_id
      t.string :ctrl_name
      t.text :desc
      t.string :position
      t.string :payroll_id
      t.date :valid_to

      t.timestamps
    end
  end
end
