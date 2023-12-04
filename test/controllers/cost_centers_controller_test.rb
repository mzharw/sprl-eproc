require "test_helper"

class CostCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_center = cost_centers(:one)
  end

  test "should get index" do
    get cost_centers_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_center_url
    assert_response :success
  end

  test "should create cost_center" do
    assert_difference("CostCenter.count") do
      post cost_centers_url, params: { cost_center: { cost_center_id: @cost_center.cost_center_id, created_by: @cost_center.created_by, ctrl_name: @cost_center.ctrl_name, desc: @cost_center.desc, payroll_id: @cost_center.payroll_id, position: @cost_center.position, purch_group_id: @cost_center.purch_group_id, updated_by_id: @cost_center.updated_by_id, valid_to: @cost_center.valid_to } }
    end

    assert_redirected_to cost_center_url(CostCenter.last)
  end

  test "should show cost_center" do
    get cost_center_url(@cost_center)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_center_url(@cost_center)
    assert_response :success
  end

  test "should update cost_center" do
    patch cost_center_url(@cost_center), params: { cost_center: { cost_center_id: @cost_center.cost_center_id, created_by: @cost_center.created_by, ctrl_name: @cost_center.ctrl_name, desc: @cost_center.desc, payroll_id: @cost_center.payroll_id, position: @cost_center.position, purch_group_id: @cost_center.purch_group_id, updated_by_id: @cost_center.updated_by_id, valid_to: @cost_center.valid_to } }
    assert_redirected_to cost_center_url(@cost_center)
  end

  test "should destroy cost_center" do
    assert_difference("CostCenter.count", -1) do
      delete cost_center_url(@cost_center)
    end

    assert_redirected_to cost_centers_url
  end
end
