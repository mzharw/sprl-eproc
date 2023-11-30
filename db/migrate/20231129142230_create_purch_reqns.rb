class CreatePurchReqns < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqns do |t|
      t.string :number
      t.text :desc
      t.references :created_by, null: false
      t.references :updated_by, null: false
      t.string :state
      t.references :purch_org, null: false
      t.string :purch_reqn_type
      t.boolean :contract
      t.references :purch_group, null: false
      t.references :plant, null: false
      t.references :cost_center, null: false
      t.string :fund_source
      t.references :currency, null: false
      t.references :recreate_from, null: false
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
      t.references :contract_reference, null: false
      t.references :prcmt, null: false

      t.timestamps
    end
  end
end
