class CreateWorkAcceptanceNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :work_acceptance_notes, id: :uuid do |t|
      t.string :number
      t.string :sap_number
      t.string :name
      t.string :state
      t.uuid :current_workflow_instance_id
      t.jsonb :data
      t.string :wan_type
      t.uuid :internal_org_id
      t.uuid :purch_org_id
      t.uuid :purch_group_id
      t.uuid :plant_id
      t.uuid :purch_order_id
      t.uuid :vendor_id
      t.uuid :to_currency
      t.uuid :incoterm_id
      t.uuid :incoterm_desc
      t.decimal :payment_term_number
      t.string :payment_term_desc
      t.string :request_type_code
      t.string :request_type
      t.timestamp :delivery_date
      t.text :desc
      t.string :receiver
      t.string :delivery_detail
      t.text :remark
      t.timestamp :released_at
      t.timestamp :rejected_at
      t.timestamp :discard_at
      t.text :cancel_remark
      t.uuid :reference_by_id
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
    add_index :work_acceptance_notes, :created_by_id
    add_index :work_acceptance_notes, :updated_by_id
    add_index :work_acceptance_notes, :number
  end
end
