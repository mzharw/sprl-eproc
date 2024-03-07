require "test_helper"

class PurchOrderTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_order_type = purch_order_types(:one)
  end

  test "should get index" do
    get purch_order_types_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_order_type_url
    assert_response :success
  end

  test "should create purch_order_type" do
    assert_difference("PurchOrderType.count") do
      post purch_order_types_url, params: { purch_order_type: { desc: @purch_order_type.desc, ident_name: @purch_order_type.ident_name, name: @purch_order_type.name, system: @purch_order_type.system } }
    end

    assert_redirected_to purch_order_type_url(PurchOrderType.last)
  end

  test "should show purch_order_type" do
    get purch_order_type_url(@purch_order_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_order_type_url(@purch_order_type)
    assert_response :success
  end

  test "should update purch_order_type" do
    patch purch_order_type_url(@purch_order_type), params: { purch_order_type: { desc: @purch_order_type.desc, ident_name: @purch_order_type.ident_name, name: @purch_order_type.name, system: @purch_order_type.system } }
    assert_redirected_to purch_order_type_url(@purch_order_type)
  end

  test "should destroy purch_order_type" do
    assert_difference("PurchOrderType.count", -1) do
      delete purch_order_type_url(@purch_order_type)
    end

    assert_redirected_to purch_order_types_url
  end
end
