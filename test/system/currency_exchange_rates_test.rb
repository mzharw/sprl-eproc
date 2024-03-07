require "application_system_test_case"

class CurrencyExchangeRatesTest < ApplicationSystemTestCase
  setup do
    @currency_exchange_rate = currency_exchange_rates(:one)
  end

  test "visiting the index" do
    visit currency_exchange_rates_url
    assert_selector "h1", text: "Currency exchange rates"
  end

  test "should create currency exchange rate" do
    visit currency_exchange_rates_url
    click_on "New currency exchange rate"

    fill_in "Created by", with: @currency_exchange_rate.created_by_id
    fill_in "From amount", with: @currency_exchange_rate.from_amount
    fill_in "From currency", with: @currency_exchange_rate.from_currency_id
    fill_in "From time", with: @currency_exchange_rate.from_time
    fill_in "Issuer", with: @currency_exchange_rate.issuer
    fill_in "Thru time", with: @currency_exchange_rate.thru_time
    fill_in "To amount", with: @currency_exchange_rate.to_amount
    fill_in "To currency", with: @currency_exchange_rate.to_currency_id
    fill_in "Updated by", with: @currency_exchange_rate.updated_by_id
    click_on "Create Currency exchange rate"

    assert_text "Currency exchange rate was successfully created"
    click_on "Back"
  end

  test "should update Currency exchange rate" do
    visit currency_exchange_rate_url(@currency_exchange_rate)
    click_on "Edit this currency exchange rate", match: :first

    fill_in "Created by", with: @currency_exchange_rate.created_by_id
    fill_in "From amount", with: @currency_exchange_rate.from_amount
    fill_in "From currency", with: @currency_exchange_rate.from_currency_id
    fill_in "From time", with: @currency_exchange_rate.from_time
    fill_in "Issuer", with: @currency_exchange_rate.issuer
    fill_in "Thru time", with: @currency_exchange_rate.thru_time
    fill_in "To amount", with: @currency_exchange_rate.to_amount
    fill_in "To currency", with: @currency_exchange_rate.to_currency_id
    fill_in "Updated by", with: @currency_exchange_rate.updated_by_id
    click_on "Update Currency exchange rate"

    assert_text "Currency exchange rate was successfully updated"
    click_on "Back"
  end

  test "should destroy Currency exchange rate" do
    visit currency_exchange_rate_url(@currency_exchange_rate)
    click_on "Destroy this currency exchange rate", match: :first

    assert_text "Currency exchange rate was successfully destroyed"
  end
end
