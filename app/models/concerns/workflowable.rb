# frozen_string_literal: true

module Workflowable
  include Taskable
  extend ActiveSupport::Concern

  included do
    default_scope { where(rejected_at: nil) }
    has_many :workflow_instances, as: :workflowable
    has_many :tasks, as: :taskable
    after_create :create_initial_workflow
    after_update :advance_workflow
  end

  def advance_workflow(instance = nil, rejected = false)
    return unless state == 'SUBMITTED'

    is_authorized = instance.nil?
    instance = last_instance

    if rejected
      create_workflow_instance(0, instance) if instance_rejected?(instance)
      workflow_after_rejected
      reject!
    else
      instance.update_step('FINISHED', updated_by_id) if instance.workflow_step&.seq&.zero?

      next_step = next_workflow_step
      seq = next_step.seq if next_step

      create_workflow_instance(seq, instance, is_authorized) unless finished?
      workflow_after_advanced if methods.include?(:workflow_after_advanced)

      update(state: 'COMMITTED') if finished?
    end

    return if is_authorized

    workflow_after_finished if methods.include?(:workflow_after_finished) && finished?
    instance&.update(state: rejected ? 'REJECTED' : 'FINISHED')
  end

  def finished?
    step = last_step if defined?(last_step)
    num = step.nil? ? workflow_steps.last.seq : step

    last_instance.workflow_step.seq >= num && last_instance.state == 'FINISHED'
  end

  def can_approve(user = nil, *groups)
    role = (workflow_map[:role] if workflow_map) if defined? workflow_map

    if user&.is_superuser?
      true
    else
      approved = user.nil? ? true : user.has_role?(role)
      unless user&.is_finance_manager? || user&.is_scm_manager?
        approved &&= user&.purch_group_ids&.include?(purch_group_id) if groups.include? :purch_groups
        approved &&= user&.plant_ids&.include?(plant_id) if groups.include? :plants
      end
      approved
    end

  end

  def user_assignees(role, *groups)
    @users = User
    unless ['Buyer', 'Manager of Finance', 'SCM Manager'].include?(role)
      @users = @users.joins(:buyer_purch_groups).where(buyer_purch_groups: { purch_group_id: }) if groups.include? :purch_groups
      @users = @users.joins(:buyer_plants).where(buyer_plants: { plant_id: }) if groups.include? :plants
    end

    @users.with_any_role(*role, 'Super Admin', 'General Manager')
  end

  private

  ## Workflow Steps
  def create_initial_workflow
    create_workflow_instance(0)
  end

  def next_workflow_step
    workflow
      .workflow_steps
      .find_by(seq: (last_instance&.workflow_step&.seq || 0) + 1)
  end

  ##

  ## Workflow Instances
  def create_workflow_instance(seq, instance = nil, authorized = false)
    # comment = instance&.rejected_comment

    number = seq.zero? ? nil : instance&.instance_number
    author = seq.zero? ? nil : instance&.updated_by_id

    created_by_id = author unless author.nil? && authorized
    created_by_id = self.created_by_id if created_by_id.nil?

    step = workflow.workflow_steps.find_by(seq:)

    tracker = { created_by_id: }

    number ||= instance_number

    workflow_instances
      .create(workflow_step: step, state: 'ACTIVE', instance_number: number, **tracker)
  end

  def instance_number
    ident = workflow.workflow_steps.first&.ident_name
    number = "#{ident}#{rand(99_999_999)}"
    instance_number unless WorkflowInstance.find_by(instance_number: number).nil?
    number
  end

  def instance_rejected?(instance)
    instance.state == 'REJECTED'
  end

  def last_instance
    workflow_instances.last
  end

  ##

  def workflow
    WorkflowStep.find_by(resource_name: self.class.name).workflow
  end

  def workflow_steps
    workflow.workflow_steps
  end

end
