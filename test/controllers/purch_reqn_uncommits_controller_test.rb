require "test_helper"

class PurchReqnUncommitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_uncommit = purch_reqn_uncommits(:one)
  end

  test "should get index" do
    get purch_reqn_uncommits_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_uncommit_url
    assert_response :success
  end

  test "should create purch_reqn_uncommit" do
    assert_difference("PurchReqnUncommit.count") do
      post purch_reqn_uncommits_url, params: { purch_reqn_uncommit: { created_by_id: @purch_reqn_uncommit.created_by_id, current_workflow_instance_id: @purch_reqn_uncommit.current_workflow_instance_id, desc: @purch_reqn_uncommit.desc, purch_reqn_id: @purch_reqn_uncommit.purch_reqn_id, state: @purch_reqn_uncommit.state, uncommit_remark: @purch_reqn_uncommit.uncommit_remark, updated_by_id: @purch_reqn_uncommit.updated_by_id } }
    end

    assert_redirected_to purch_reqn_uncommit_url(PurchReqnUncommit.last)
  end

  test "should show purch_reqn_uncommit" do
    get purch_reqn_uncommit_url(@purch_reqn_uncommit)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_uncommit_url(@purch_reqn_uncommit)
    assert_response :success
  end

  test "should update purch_reqn_uncommit" do
    patch purch_reqn_uncommit_url(@purch_reqn_uncommit), params: { purch_reqn_uncommit: { created_by_id: @purch_reqn_uncommit.created_by_id, current_workflow_instance_id: @purch_reqn_uncommit.current_workflow_instance_id, desc: @purch_reqn_uncommit.desc, purch_reqn_id: @purch_reqn_uncommit.purch_reqn_id, state: @purch_reqn_uncommit.state, uncommit_remark: @purch_reqn_uncommit.uncommit_remark, updated_by_id: @purch_reqn_uncommit.updated_by_id } }
    assert_redirected_to purch_reqn_uncommit_url(@purch_reqn_uncommit)
  end

  test "should destroy purch_reqn_uncommit" do
    assert_difference("PurchReqnUncommit.count", -1) do
      delete purch_reqn_uncommit_url(@purch_reqn_uncommit)
    end

    assert_redirected_to purch_reqn_uncommits_url
  end
end
