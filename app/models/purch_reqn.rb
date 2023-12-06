class PurchReqn < ApplicationRecord
  include NumberTrackable

  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  belongs_to :purch_org, foreign_key: :purch_org_id
  belongs_to :purch_group, foreign_key: :purch_group_id
  belongs_to :plant, foreign_key: :plant_id
  belongs_to :cost_center, foreign_key: :cost_center_id, optional: true
  belongs_to :currency, foreign_key: :currency_id, optional: true
  has_many :items, class_name: 'PurchReqnItem', foreign_key: 'purch_reqn'
  has_many_attached :contract_docs
  has_many_attached :contract_ex_sp_docs
  has_many_attached :memo_scm_manager_docs
  has_many_attached :work_ex_plan_docs
  has_many_attached :owner_estimate_docs
  has_many_attached :tech_eval_method_docs
  has_many_attached :det_landing_cost_docs
  has_many_attached :inspect_eval_method_docs
  has_many_attached :risk_assessment_docs
  has_many_attached :justify_memo_docs
  has_many_attached :res_util_justify_docs
  # belongs_to :purch_reqn, foreign_key: :recreate_from_id
  # belongs_to :contract, foreign_key: :contract_reference_id
  # belongs_to :prcmt, foreign_key: :prcmt_id

  track_number(:number, -8, '0', prefix: :purch_reqn_type, prefix_options: { 'MATERIAL' => '12', 'SERVICE' => '14' })
end
