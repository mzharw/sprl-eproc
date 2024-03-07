class AddPrToWanAndPurchOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :purch_orders, :purch_reqn_id, :uuid
    add_column :work_acceptance_notes, :purch_reqn_id, :uuid
  end
end
