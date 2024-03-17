class PurchOrderItemDecorator < PurchReqnItemDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def subtotal
    format_number(object&.subtotal)
  end

  def unit_price
    format_number(object&.unit_price)
  end

end
