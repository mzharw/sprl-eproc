class CreateCurrencyExchangeRates < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_exchange_rates, id: :uuid do |t|
      t.uuid :from_currency_id
      t.decimal :from_amount
      t.uuid :to_currency_id
      t.decimal :to_amount
      t.timestamp :from_time
      t.timestamp :thru_time
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.string :issuer

      t.timestamps
    end
  end
end
