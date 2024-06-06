class AddHsseRiskToPurchReqnsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :purch_reqns, :hsse_risk, :string
  end
end
