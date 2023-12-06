class CreatePrcmts < ActiveRecord::Migration[7.1]
  def change
    create_table :prcmts, id: :uuid do |t|
      t.uuid :app_id
      t.uuid :prcmt_type_id
      t.string :number
      t.string :name
      t.text :scope_of_work
      t.uuid :purch_org_id
      t.uuid :purch_group_id
      t.uuid :buyer_id
      t.string :prebid_meeting
      t.boolean :prequalification
      t.boolean :auction
      t.string :bid_submission_method
      t.string :quotation_media
      t.integer :quotation_validity_days
      t.string :eval_method
      t.uuid :incoterm_id
      t.string :proposed_delivery_location
      t.string :purch_order_number
      t.string :contract_number
      t.jsonb :data
      t.uuid :current_workflow_instance_id
      t.string :state
      t.boolean :bid_bond
      t.jsonb :scope_of_supplies
      t.timestamp :announced_at
      t.timestamp :cancelled_at
      t.timestamp :finished_at
      t.text :desc
      t.text :internal_remark
      t.text :candidate_selection_remark
      t.text :finish_remark
      t.string :prcmt_phase_evaluation_visibility
      t.text :cancel_remark
      t.string :aanwijzing_visibility
      t.string :bid_bond_visibility
      t.decimal :est_total
      t.uuid :prcmt_criterion_template_id
      t.uuid :internal_org_id
      t.uuid :plant_id
      t.string :assessment_method
      t.json :business_class
      t.string :business_field
      t.decimal :tkdn_percentage
      t.string :tender_location

      t.uuid :created_by
      t.uuid :updated_by
      t.timestamps
    end
    add_index :prcmts, :created_by
    add_index :prcmts, :updated_by
  end
end
