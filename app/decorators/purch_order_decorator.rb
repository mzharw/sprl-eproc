class PurchOrderDecorator < ApplicationDecorator
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
  def items_subtotal_num
    purch_order_items.sum(:subtotal)
  end

  def items_subtotal
    format_number(items_subtotal_num)
  end

  def submitted?
    object&.state != 'DRAFT'
  end

  def submitable?
    true
  end

  def po_type
    purch_order_type.name
  end

  def pr_number
    purch_reqn.number
  end

  def workflow_instance
    object.workflow_instances.last
  end

  def workflow_state
    step = workflow_instance&.workflow_step
    (step&.seq || 0).zero? ? '' : step&.name
  end
end
