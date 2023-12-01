require "test_helper"

class PurchReqnPartialStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_partial_status = purch_reqn_partial_statuses(:one)
  end

  test "should get index" do
    get purch_reqn_partial_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_partial_status_url
    assert_response :success
  end

  test "should create purch_reqn_partial_status" do
    assert_difference("PurchReqnPartialStatus.count") do
      post purch_reqn_partial_statuses_url, params: { purch_reqn_partial_status: { app_id: @purch_reqn_partial_status.app_id, created_by_id: @purch_reqn_partial_status.created_by_id, partial_itemable_id: @purch_reqn_partial_status.partial_itemable_id, partial_itemable_type: @purch_reqn_partial_status.partial_itemable_type, partialable_id: @purch_reqn_partial_status.partialable_id, partialable_type: @purch_reqn_partial_status.partialable_type, purch_reqn_partial_id: @purch_reqn_partial_status.purch_reqn_partial_id, status: @purch_reqn_partial_status.status, updated_by_id: @purch_reqn_partial_status.updated_by_id } }
    end

    assert_redirected_to purch_reqn_partial_status_url(PurchReqnPartialStatus.last)
  end

  test "should show purch_reqn_partial_status" do
    get purch_reqn_partial_status_url(@purch_reqn_partial_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_partial_status_url(@purch_reqn_partial_status)
    assert_response :success
  end

  test "should update purch_reqn_partial_status" do
    patch purch_reqn_partial_status_url(@purch_reqn_partial_status), params: { purch_reqn_partial_status: { app_id: @purch_reqn_partial_status.app_id, created_by_id: @purch_reqn_partial_status.created_by_id, partial_itemable_id: @purch_reqn_partial_status.partial_itemable_id, partial_itemable_type: @purch_reqn_partial_status.partial_itemable_type, partialable_id: @purch_reqn_partial_status.partialable_id, partialable_type: @purch_reqn_partial_status.partialable_type, purch_reqn_partial_id: @purch_reqn_partial_status.purch_reqn_partial_id, status: @purch_reqn_partial_status.status, updated_by_id: @purch_reqn_partial_status.updated_by_id } }
    assert_redirected_to purch_reqn_partial_status_url(@purch_reqn_partial_status)
  end

  test "should destroy purch_reqn_partial_status" do
    assert_difference("PurchReqnPartialStatus.count", -1) do
      delete purch_reqn_partial_status_url(@purch_reqn_partial_status)
    end

    assert_redirected_to purch_reqn_partial_statuses_url
  end
end
