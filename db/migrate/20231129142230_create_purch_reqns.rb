class CreatePurchReqns < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqns, id: :uuid do |t|
      t.string :number
      t.text :desc
      t.string :state
      t.uuid :purch_org_id
      t.string :purch_reqn_type
      t.boolean :contract
      t.uuid :purch_group_id
      t.uuid :plant_id
      t.uuid :cost_center_id
      t.string :fund_source
      t.uuid :currency_id
      t.uuid :recreate_from_id
      t.string :contract_title
      t.string :scope_of_work
      t.string :justification
      t.string :budget_soure
      t.string :reason
      t.string :contract_type
      t.string :risk_category
      t.string :explanation
      t.string :previous_contract_number
      t.string :previous_contract_title
      t.decimal :local_of_content
      t.timestamp :rejected_at
      t.text :cancel_remark
      t.uuid :contract_reference_id
      t.uuid :prcmt_id
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :purch_reqns, :number, unique: true
    add_index :purch_reqns, :purch_org_id
    add_index :purch_reqns, :purch_group_id
    add_index :purch_reqns, :plant_id
    add_index :purch_reqns, :cost_center_id
    add_index :purch_reqns, :currency_id
    add_index :purch_reqns, :created_by
    add_index :purch_reqns, :updated_by
    add_index :purch_reqns, :discarded_at
  end
end
