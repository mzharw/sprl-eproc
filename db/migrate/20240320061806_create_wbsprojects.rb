class CreateWbsprojects < ActiveRecord::Migration[7.1]
  def change
    create_table :wbsprojects, id: :uuid do |t|
      t.uuid :parent_id
      t.string :ctrl_name
      t.string :position
      t.string :payroll_id
      t.string :wbs_id
      t.text :desc
      t.string :object_number
      t.string :istat
      t.string :usr03
      t.string :short_status
      t.string :long_status
      t.string :pack_short_status
      t.string :pack_long_status
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :responsible_cc_id

      t.timestamps
    end
  end
end
