class AddWbsprojectIdToPurchReqnsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :purch_reqns, :wbsproject_id, :uuid
  end
end
