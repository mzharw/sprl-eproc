# frozen_string_literal: true

class PurchReqn < ApplicationRecord
  include ModelTrackable
  include Workflowable

  track_user
  track_number(
    :number, pad_value: -8, pad_char: '0',
    prefix: :purch_reqn_type,
    prefix_options: { 'MATERIAL' => '12', 'SERVICE' => '14' }
  )

  resourcify

  belongs_to :prior_to, class_name: 'PurchReqn', foreign_key: :prior_to_id, optional: true
  belongs_to :purch_org, foreign_key: :purch_org_id
  belongs_to :purch_group, foreign_key: :purch_group_id
  belongs_to :plant, foreign_key: :plant_id
  belongs_to :cost_center, foreign_key: :cost_center_id, optional: true
  belongs_to :wbsproject, foreign_key: :wbsproject_id, optional: true
  belongs_to :currency, foreign_key: :currency_id, optional: true
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
  has_many :items, class_name: 'PurchReqnItem', foreign_key: :purch_reqn_id
  has_many :prcmt_items, class_name: 'PrcmtItem', through: :items
  has_many :purch_order_items, class_name: 'PurchOrderItem', through: :items

  # belongs_to :purch_reqn, foreign_key: :prior_to_id
  # belongs_to :contract, foreign_key: :contract_reference_id
  # belongs_to :prcmt, foreign_key: :prcmt_id

  validates :purch_reqn_type, presence: { message: 'is required' }
  validates :currency, presence: { message: 'is required' }
  validates :contract, inclusion: { in: [true, false] }
  validates :purch_org_id, presence: true
  validates :desc, presence: true
  validates :fund_source, presence: true
  validates :cost_center_id, presence: true, if: :cost_center_fund_source?
  validates :wbsproject_id, presence: true, if: :project_afe_fund_source?

  DOCS = {
    contract_docs: 'Contract Document',
    contract_ex_sp_docs: 'Contract Exhibits/Specification',
    memo_scm_manager_docs: 'Memo SCM Manager',
    work_ex_plan_docs: 'Work Execution Plan',
    owner_estimate_docs: 'Owner Estimate',
    tech_eval_method_docs: 'Technical Evaluation Method',
    det_landing_cost_docs: 'Detail Landing Cost',
    inspect_eval_method_docs: 'Inspection Evaluation Method',
    risk_assessment_docs: 'Risk Assessment',
    justify_memo_docs: 'Justification Memo',
    res_util_justify_docs: 'Resource Utilization Justification'
  }.freeze

  def self.check_docs(params)
    DOCS.each_key do |document_type|
      return document_type if params[document_type].present?
    end
    nil
  end

  def self.doc_title(name)
    DOCS[name]
  end

  def workflow_after_advanced
    PurchReqnMailer.with(receiver: workflow_map, model: self).approval_notice.deliver_later if workflow_map
    update_task(!finished?)
  end

  def workflow_after_rejected
    PurchReqnMailer.with(model: self).reject_notice.deliver_later
    update_task(false)
  end

  def last_step
    curr = Currency.find_by(code: 'IDR')
    item_subtotal = items.listed.sum(:est_subtotal)

    unless currency_id == curr.id
      rate = CurrencyExchangeRate.where(from_currency_id: curr.id).find_by(to_currency_id: currency_id)
      item_subtotal = (item_subtotal.to_f / rate.from_amount) * rate.to_amount unless rate.nil?
    end

    5 if item_subtotal < 50000000
  end

  private

  def cost_center_fund_source?
    fund_source == 'COST_CENTER'
  end

  def project_afe_fund_source?
    fund_source == 'PROJECT_WBS'
  end

  def reject!
    rejected = dup
    rejected.rejected_at = DateTime.now
    rejected.save!

    update(state: 'DRAFT')
  end

  def workflow_map
    last_instance = workflow_instances.last
    seq = last_instance.workflow_step.seq
    role = case seq
           when 1
             {
               role: 'Section Head User',
               display_role: 'Section Head of User'
             }
           when 2
             {
               role: 'Budget Controller',
               display_role: 'Budget Controller'
             }
           when 3
             {
               role: 'Manager of User',
               display_role: 'Manager of User'
             }
           when 4
             {
               role: 'Manager SCM',
               display_role: 'Manager SCM'
             }
           when 5
             {
               role: 'Manager of Finance',
               display_role: 'Manager of Finance'
             }
           when 6
             {
               role: 'General Manager',
               display_role: 'General Manager'
             }
           else
             false
           end

    self.assignees = user_assignees(role[:role], :purch_groups) if role
    self.task_name = "Purchase Requisition : #{role[:display_role]} Approval" if role

    role[:assignees] = assignees&.pluck(:email) if role
    role[:creator] = creator.email if role
    role[:seq] = seq if role
    role
  end

end
