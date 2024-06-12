class AddTermOfPaymentColumnToPurchReqnsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :purch_reqns, :term_of_payment, :string
  end
end
