class CurrencyExchangeRateDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def from_currency_text
    "<b>#{from_currency.code}</b> - #{from_currency.name}"
  end

  def to_currency_text
    "<b>#{to_currency.code}</b> - #{to_currency.name}"
  end
end
