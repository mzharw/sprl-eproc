require "test_helper"

class PurchReqnItemBuyersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_item_buyer = purch_reqn_item_buyers(:one)
  end

  test "should get index" do
    get purch_reqn_item_buyers_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_item_buyer_url
    assert_response :success
  end

  test "should create purch_reqn_item_buyer" do
    assert_difference("PurchReqnItemBuyer.count") do
      post purch_reqn_item_buyers_url, params: { purch_reqn_item_buyer: { buyer_id: @purch_reqn_item_buyer.buyer_id, created_by_id: @purch_reqn_item_buyer.created_by_id, purch_reqn_item_id: @purch_reqn_item_buyer.purch_reqn_item_id, updated_by_id: @purch_reqn_item_buyer.updated_by_id } }
    end

    assert_redirected_to purch_reqn_item_buyer_url(PurchReqnItemBuyer.last)
  end

  test "should show purch_reqn_item_buyer" do
    get purch_reqn_item_buyer_url(@purch_reqn_item_buyer)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_item_buyer_url(@purch_reqn_item_buyer)
    assert_response :success
  end

  test "should update purch_reqn_item_buyer" do
    patch purch_reqn_item_buyer_url(@purch_reqn_item_buyer), params: { purch_reqn_item_buyer: { buyer_id: @purch_reqn_item_buyer.buyer_id, created_by_id: @purch_reqn_item_buyer.created_by_id, purch_reqn_item_id: @purch_reqn_item_buyer.purch_reqn_item_id, updated_by_id: @purch_reqn_item_buyer.updated_by_id } }
    assert_redirected_to purch_reqn_item_buyer_url(@purch_reqn_item_buyer)
  end

  test "should destroy purch_reqn_item_buyer" do
    assert_difference("PurchReqnItemBuyer.count", -1) do
      delete purch_reqn_item_buyer_url(@purch_reqn_item_buyer)
    end

    assert_redirected_to purch_reqn_item_buyers_url
  end
end
