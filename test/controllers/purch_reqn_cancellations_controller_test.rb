require "test_helper"

class PurchReqnCancellationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_cancellation = purch_reqn_cancellations(:one)
  end

  test "should get index" do
    get purch_reqn_cancellations_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_cancellation_url
    assert_response :success
  end

  test "should create purch_reqn_cancellation" do
    assert_difference("PurchReqnCancellation.count") do
      post purch_reqn_cancellations_url, params: { purch_reqn_cancellation: { app_id: @purch_reqn_cancellation.app_id, created_by_id: @purch_reqn_cancellation.created_by_id, current_workflow_instance_id: @purch_reqn_cancellation.current_workflow_instance_id, purch_reqn_id: @purch_reqn_cancellation.purch_reqn_id, state: @purch_reqn_cancellation.state, updated_by_id: @purch_reqn_cancellation.updated_by_id } }
    end

    assert_redirected_to purch_reqn_cancellation_url(PurchReqnCancellation.last)
  end

  test "should show purch_reqn_cancellation" do
    get purch_reqn_cancellation_url(@purch_reqn_cancellation)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_cancellation_url(@purch_reqn_cancellation)
    assert_response :success
  end

  test "should update purch_reqn_cancellation" do
    patch purch_reqn_cancellation_url(@purch_reqn_cancellation), params: { purch_reqn_cancellation: { app_id: @purch_reqn_cancellation.app_id, created_by_id: @purch_reqn_cancellation.created_by_id, current_workflow_instance_id: @purch_reqn_cancellation.current_workflow_instance_id, purch_reqn_id: @purch_reqn_cancellation.purch_reqn_id, state: @purch_reqn_cancellation.state, updated_by_id: @purch_reqn_cancellation.updated_by_id } }
    assert_redirected_to purch_reqn_cancellation_url(@purch_reqn_cancellation)
  end

  test "should destroy purch_reqn_cancellation" do
    assert_difference("PurchReqnCancellation.count", -1) do
      delete purch_reqn_cancellation_url(@purch_reqn_cancellation)
    end

    assert_redirected_to purch_reqn_cancellations_url
  end
end
