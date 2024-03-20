class PurchReqnItemDecorator < PurchReqnDecorator
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

  def items
    service_items.decorate
  end

  def product_code
    product&.code
  end

  def product_name
    product&.name
  end

  def product_group_code
    product_group&.code
  end

  def product_group_name
    product_group&.name
  end

  def est_unit_price
    format_number(object&.est_unit_price || 0)
  end

  def est_subtotal
    format_number(object&.est_subtotal || 0)
  end

  def product_group_text
    "<b>#{product_group_code}</b> - #{product_group_name}"
  end

  def carried_out_qty
    prcmt_items ? prcmt_items.sum(:qty) || 0.0 : 0.0
  end

end
