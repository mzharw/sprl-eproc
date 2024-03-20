class PrcmtDecorator < ApplicationDecorator
  delegate_all
  decorates_association :purch_reqn

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def items_subtotal_num
    prcmt_items.sum(:est_subtotal)
  end

  def items_subtotal
    format_number(items_subtotal_num)
  end

  def purch_reqn_no
    purch_reqn&.number
  end

  def purch_reqn
    prcmt_items&.first&.purch_reqn
  end
end
