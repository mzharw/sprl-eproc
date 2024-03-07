class CreatePurchOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_orders, id: :uuid do |t|
      t.uuid :purch_order_type_id
      t.string :number
      t.date :issued_date
      t.string :name
      t.uuid :incoterm_id
      t.string :incoterm_desc
      t.uuid :internal_org_id
      t.uuid :purch_org_id
      t.uuid :purch_group_id
      t.uuid :prcmt_id
      t.jsonb :data
      t.string :state
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :vendor_id
      t.string :referrable_type
      t.uuid :referrable_id
      t.uuid :payment_term_id
      t.string :delivery_location
      t.uuid :current_workflow_instance_id
      t.boolean :used_up
      t.timestamp :finished_at
      t.timestamp :discarded_at
      t.uuid :finished_by_id
      t.integer :length_of_work
      t.float :payment_term_number
      t.string :payment_term_desc
      t.string :po_type
      t.boolean :contract
      t.date :validity_start_date
      t.date :commentcement_date
      t.text :delivery_detail
      t.text :remark
      t.text :scope_of_work
      t.float :po_to_amount
      t.string :account_holder
      t.string :account_number
      t.string :po_signing
      t.boolean :tax_policy
      t.uuid :to_currency_id
      t.date :rejected_at
      t.uuid :cost_center_id
      t.uuid :plant_id
      t.string :uncommit_remark
      t.boolean :is_replicated

      t.timestamps
    end
  end
end
