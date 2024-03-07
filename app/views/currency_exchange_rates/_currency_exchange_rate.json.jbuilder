json.extract! currency_exchange_rate, :id, :from_currency_id, :from_amount, :to_currency_id, :to_amount, :from_time, :thru_time, :created_by_id, :updated_by_id, :issuer, :created_at, :updated_at
json.url currency_exchange_rate_url(currency_exchange_rate, format: :json)
