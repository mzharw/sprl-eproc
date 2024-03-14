class CurrencyExchangeRate < ApplicationRecord
  include ModelTrackable

  track_user(true)

  belongs_to :from_currency, class_name: 'Currency', foreign_key: :from_currency_id, optional: true
  belongs_to :to_currency, class_name: 'Currency', foreign_key: :to_currency_id, optional: true
end
