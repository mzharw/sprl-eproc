# frozen_string_literal: true

class PurchReqnDecorator < ApplicationDecorator
  delegate_all

  decorates_association :workflow_instances, scope: :passed
  decorates_association :workflow

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def plant_code
    object.plant&.code
  end

  def plant_name
    object.plant&.party&.full_name
  end

  def cost_center_code
    object.cost_center&.cost_center_id
  end

  def cost_center_desc
    object.cost_center&.desc
  end

  def purch_group_code
    object.purch_group&.code
  end

  def currency_code
    object.currency&.code
  end

  def items_subtotal
    listed_items.sum(:est_subtotal)
  end

  def submitable?
    items_subtotal.positive? &&
      object.contract_ex_sp_docs.exists? &&
      object.work_ex_plan_docs.exists? &&
      object.tech_eval_method_docs.exists? &&
      object.owner_estimate_docs.exists?
    # true
  end

  def submitted?
    object&.state == 'COMMITTED'
  end

  def workflow_instance
    object.workflow_instances.last
  end

  def workflow_state
    step = workflow_instance&.workflow_step
    (step&.seq || 0).zero? ? '' : step&.name
  end

  def doc_title(name)
    object.class.doc_title(name)
  end

  def listed_items
    items.where.not(item_type: 'SERVICE_ITEM')
  end

  def decorated_items
    listed_items.decorate
  end
end
