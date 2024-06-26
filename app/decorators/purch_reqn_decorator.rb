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
  def fund_source
    source = 'Cost Center' if object&.fund_source == 'COST_CENTER'
    source = 'Project AFE' if object&.fund_source == 'PROJECT_WBS'

    source
  end

  def items_subtotal
    format_number(items_subtotal_num)
  end

  def items_subtotal_num
    listed_items.sum(:est_subtotal)
  end

  def submitable?
    items_subtotal_num.positive? &&
      object.contract_ex_sp_docs.exists? &&
      object.work_ex_plan_docs.exists? &&
      object.tech_eval_method_docs.exists? &&
      object.owner_estimate_docs.exists?
    # true
  end

  def submitted?
    object&.state != 'DRAFT'
  end

  def have_been_rejected?
    object&.workflow_instances.exists?(state: 'REJECTED')
  end

  def doc_title(name)
    object.class.doc_title(name)
  end

  def listed_items
    items.listed
  end

  def decorated_items
    listed_items.decorate
  end
end
