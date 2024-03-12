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

  def items_subtotal
    listed_items.sum(:est_subtotal)
  end

  def submitable?
    object.state != 'COMMITTED' &&
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
