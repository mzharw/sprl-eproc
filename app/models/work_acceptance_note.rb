class WorkAcceptanceNote < ApplicationRecord
  include ModelTrackable
  include Workflowable
  track_user
  track_number(
    :number, pad_value: -8, pad_char: '0', prefix: '6'
  )

  belongs_to :vendor
  belongs_to :purch_order
  belongs_to :purch_group
  belongs_to :currency, optional: true
  belongs_to :purch_org, optional: true
  belongs_to :purch_reqn, optional: true
  belongs_to :plant

  has_many :items, class_name: 'WorkAcceptanceNoteItem', foreign_key: :work_acceptance_note_id
  has_one_attached :attachment

  validates :name, presence: true
  validates :wan_type, presence: true
  validates :purch_reqn_id, presence: true
  validates :purch_order_id, presence: true

  DOCS = {
    attachment: 'Attachment',
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
    WanMailer.with(receiver: workflow_map, model: self).approval_notice.deliver_later if workflow_map
    update_task(!finished?)
  end

  def workflow_after_rejected
    WanMailer.with(model: self).reject_notice.deliver_later
    update_task(false)
  end

  def reject!
    rejected = dup
    rejected.rejected_at = DateTime.now
    rejected.save!

    update(state: 'DRAFT')
  end

  def workflow_map
    last_instance = workflow_instances.last
    self.assignees = User.where(username: 'admin')
    role = case last_instance.workflow_step.seq
           when 1
             {
               role: 'Section Head User',
               display_role: 'Section Head of User'
             }
           when 2
             {
               role: 'Manager of User',
               display_role: 'Manager of User'
             }
           else
             false
           end
    self.assignees = user_assignees(role[:role], :purch_groups) if role
    self.task_name = "WAN : #{role[:display_role]} Approval" if role

    role[:assignees] = assignees&.pluck(:email) if role
    role[:creator] = creator.email if role
    role
  end
end
