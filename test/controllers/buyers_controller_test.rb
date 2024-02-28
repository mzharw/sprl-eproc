require "test_helper"

class BuyersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer = buyers(:one)
  end

  test "should get index" do
    get buyers_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_url
    assert_response :success
  end

  test "should create buyer" do
    assert_difference("Buyer.count") do
      post buyers_url, params: { buyer: { code: @buyer.code, created_at: @buyer.created_at, from_date: @buyer.from_date, party_id: @buyer.party_id, thru_date: @buyer.thru_date, updated_at: @buyer.updated_at } }
    end

    assert_redirected_to buyer_url(Buyer.last)
  end

  test "should show buyer" do
    get buyer_url(@buyer)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_url(@buyer)
    assert_response :success
  end

  test "should update buyer" do
    patch buyer_url(@buyer), params: { buyer: { code: @buyer.code, created_at: @buyer.created_at, from_date: @buyer.from_date, party_id: @buyer.party_id, thru_date: @buyer.thru_date, updated_at: @buyer.updated_at } }
    assert_redirected_to buyer_url(@buyer)
  end

  test "should destroy buyer" do
    assert_difference("Buyer.count", -1) do
      delete buyer_url(@buyer)
    end

    assert_redirected_to buyers_url
  end
end
