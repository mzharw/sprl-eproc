require "test_helper"

class PurchReqnPartialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_partial = purch_reqn_partials(:one)
  end

  test "should get index" do
    get purch_reqn_partials_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_partial_url
    assert_response :success
  end

  test "should create purch_reqn_partial" do
    assert_difference("PurchReqnPartial.count") do
      post purch_reqn_partials_url, params: { purch_reqn_partial: { app_id: @purch_reqn_partial.app_id, created_by: @purch_reqn_partial.created_by, data: @purch_reqn_partial.data, partial_itemable_id: @purch_reqn_partial.partial_itemable_id, partial_itemable_type: @purch_reqn_partial.partial_itemable_type, partialable_id: @purch_reqn_partial.partialable_id, partialable_type: @purch_reqn_partial.partialable_type, purch_reqn_item_id: @purch_reqn_partial.purch_reqn_item_id, qty: @purch_reqn_partial.qty, state: @purch_reqn_partial.state, updated_by: @purch_reqn_partial.updated_by } }
    end

    assert_redirected_to purch_reqn_partial_url(PurchReqnPartial.last)
  end

  test "should show purch_reqn_partial" do
    get purch_reqn_partial_url(@purch_reqn_partial)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_partial_url(@purch_reqn_partial)
    assert_response :success
  end

  test "should update purch_reqn_partial" do
    patch purch_reqn_partial_url(@purch_reqn_partial), params: { purch_reqn_partial: { app_id: @purch_reqn_partial.app_id, created_by: @purch_reqn_partial.created_by, data: @purch_reqn_partial.data, partial_itemable_id: @purch_reqn_partial.partial_itemable_id, partial_itemable_type: @purch_reqn_partial.partial_itemable_type, partialable_id: @purch_reqn_partial.partialable_id, partialable_type: @purch_reqn_partial.partialable_type, purch_reqn_item_id: @purch_reqn_partial.purch_reqn_item_id, qty: @purch_reqn_partial.qty, state: @purch_reqn_partial.state, updated_by: @purch_reqn_partial.updated_by } }
    assert_redirected_to purch_reqn_partial_url(@purch_reqn_partial)
  end

  test "should destroy purch_reqn_partial" do
    assert_difference("PurchReqnPartial.count", -1) do
      delete purch_reqn_partial_url(@purch_reqn_partial)
    end

    assert_redirected_to purch_reqn_partials_url
  end
end
