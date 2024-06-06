class PurchOrder < ApplicationRecord
  include ModelTrackable
  include Workflowable

  track_user
  track_number(
    :number, pad_value: -8, pad_char: '0', prefix: '42'
  )

  belongs_to :purch_order_type
  belongs_to :vendor
  belongs_to :plant
  belongs_to :prcmt
  belongs_to :purch_reqn, optional: true

  has_many :purch_order_items
  has_many :purch_reqn_items, through: :purch_order_items
  # has_many :purch_reqns, through: :purch_reqn_items

  validates :vendor_id, presence: { message: 'is required' }
  validates :name, presence: true
  validates :purch_order_type_id, presence: true
  validates :plant_id, presence: true

  def workflow_after_advanced
    PurchOrderMailer.with(receiver: workflow_map, model: self).approval_notice.deliver_later if workflow_map
    update_task(!finished?)
  end

  def workflow_after_rejected
    PurchOrderMailer.with(model: self).reject_notice.deliver_later
    update_task(false)
  end

  def workflow_after_finished
    update(fully_approved_at: DateTime.now)
    purch_reqn.update!(state: 'FINISHED')
  end

  private

  def reject!
    rejected = dup
    rejected.rejected_at = DateTime.now
    rejected.save!

    update(state: 'DRAFT')
  end

  def workflow_map
    last_instance = workflow_instances.last
    self.assignees = User.where(username: 'admin')
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

    assignees = user_assignees(role[:role], :purch_groups) if role
    self.assignees = assignees
    self.task_name = "Purchase Order : #{role[:display_role]} Approval" if role

    role[:assignees] = assignees&.pluck(:email) if role
    role[:creator] = creator.email if role
    role[:seq] = seq if role
    role
  end
end
