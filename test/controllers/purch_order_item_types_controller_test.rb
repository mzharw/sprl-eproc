require "test_helper"

class PurchOrderItemTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_order_item_type = purch_order_item_types(:one)
  end

  test "should get index" do
    get purch_order_item_types_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_order_item_type_url
    assert_response :success
  end

  test "should create purch_order_item_type" do
    assert_difference("PurchOrderItemType.count") do
      post purch_order_item_types_url, params: { purch_order_item_type: { children_allowed: @purch_order_item_type.children_allowed, desc: @purch_order_item_type.desc, ident_name: @purch_order_item_type.ident_name, name: @purch_order_item_type.name, parent_id: @purch_order_item_type.parent_id, sales_taxable: @purch_order_item_type.sales_taxable, seq: @purch_order_item_type.seq, sign: @purch_order_item_type.sign, system: @purch_order_item_type.system } }
    end

    assert_redirected_to purch_order_item_type_url(PurchOrderItemType.last)
  end

  test "should show purch_order_item_type" do
    get purch_order_item_type_url(@purch_order_item_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_order_item_type_url(@purch_order_item_type)
    assert_response :success
  end

  test "should update purch_order_item_type" do
    patch purch_order_item_type_url(@purch_order_item_type), params: { purch_order_item_type: { children_allowed: @purch_order_item_type.children_allowed, desc: @purch_order_item_type.desc, ident_name: @purch_order_item_type.ident_name, name: @purch_order_item_type.name, parent_id: @purch_order_item_type.parent_id, sales_taxable: @purch_order_item_type.sales_taxable, seq: @purch_order_item_type.seq, sign: @purch_order_item_type.sign, system: @purch_order_item_type.system } }
    assert_redirected_to purch_order_item_type_url(@purch_order_item_type)
  end

  test "should destroy purch_order_item_type" do
    assert_difference("PurchOrderItemType.count", -1) do
      delete purch_order_item_type_url(@purch_order_item_type)
    end

    assert_redirected_to purch_order_item_types_url
  end
end
