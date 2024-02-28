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
    return unless state == 'COMMITTED'

    is_authorized = instance.nil?
    instance = workflow_instances.last

    if rejected
      create_workflow_instance(0) if instance_rejected?(instance)
      workflow_after_rejected
      reject!
    else
      instance.update_step('FINISHED', updated_by_id) if instance.workflow_step&.seq&.zero?

      next_step = next_workflow_step
      return false unless next_step

      seq = next_step.seq
      create_workflow_instance(seq, instance, is_authorized)
      workflow_after_advanced if methods.include?(:workflow_after_advanced)
    end

    return if is_authorized

    instance&.update(state: rejected ? 'REJECTED' : 'FINISHED')
  end

  def finished?
    num = defined?(last_step) ? last_step : workflow_steps.count
    workflow_instances.last.workflow_step.seq >= num
  end

  private

  ## Workflow Steps
  def create_initial_workflow
    create_workflow_instance(0)
  end

  def next_workflow_step
    workflow
      .workflow_steps
      .find_by(seq: (workflow_instances.last&.workflow_step&.seq || 0) + 1)
  end
  ##

  ## Workflow Instances
  def create_workflow_instance(seq, instance = nil, authorized = false)
    number = instance&.instance_number
    author = instance&.updated_by_id

    created_by_id = author unless author.nil? && authorized

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
  ##

  def workflow
    WorkflowStep.find_by(resource_name: self.class.name).workflow
  end

  def workflow_steps
    workflow.workflow_steps
  end

end
