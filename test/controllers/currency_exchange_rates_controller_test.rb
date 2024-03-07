require "test_helper"

class CurrencyExchangeRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency_exchange_rate = currency_exchange_rates(:one)
  end

  test "should get index" do
    get currency_exchange_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_currency_exchange_rate_url
    assert_response :success
  end

  test "should create currency_exchange_rate" do
    assert_difference("CurrencyExchangeRate.count") do
      post currency_exchange_rates_url, params: { currency_exchange_rate: { created_by_id: @currency_exchange_rate.created_by_id, from_amount: @currency_exchange_rate.from_amount, from_currency_id: @currency_exchange_rate.from_currency_id, from_time: @currency_exchange_rate.from_time, issuer: @currency_exchange_rate.issuer, thru_time: @currency_exchange_rate.thru_time, to_amount: @currency_exchange_rate.to_amount, to_currency_id: @currency_exchange_rate.to_currency_id, updated_by_id: @currency_exchange_rate.updated_by_id } }
    end

    assert_redirected_to currency_exchange_rate_url(CurrencyExchangeRate.last)
  end

  test "should show currency_exchange_rate" do
    get currency_exchange_rate_url(@currency_exchange_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_currency_exchange_rate_url(@currency_exchange_rate)
    assert_response :success
  end

  test "should update currency_exchange_rate" do
    patch currency_exchange_rate_url(@currency_exchange_rate), params: { currency_exchange_rate: { created_by_id: @currency_exchange_rate.created_by_id, from_amount: @currency_exchange_rate.from_amount, from_currency_id: @currency_exchange_rate.from_currency_id, from_time: @currency_exchange_rate.from_time, issuer: @currency_exchange_rate.issuer, thru_time: @currency_exchange_rate.thru_time, to_amount: @currency_exchange_rate.to_amount, to_currency_id: @currency_exchange_rate.to_currency_id, updated_by_id: @currency_exchange_rate.updated_by_id } }
    assert_redirected_to currency_exchange_rate_url(@currency_exchange_rate)
  end

  test "should destroy currency_exchange_rate" do
    assert_difference("CurrencyExchangeRate.count", -1) do
      delete currency_exchange_rate_url(@currency_exchange_rate)
    end

    assert_redirected_to currency_exchange_rates_url
  end
end
