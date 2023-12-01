require "test_helper"

class PurchReqnItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_item = purch_reqn_items(:one)
  end

  test "should get index" do
    get purch_reqn_items_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_item_url
    assert_response :success
  end

  test "should create purch_reqn_item" do
    assert_difference("PurchReqnItem.count") do
      post purch_reqn_items_url, params: { purch_reqn_item: { adjustment_qty: @purch_reqn_item.adjustment_qty, app_id: @purch_reqn_item.app_id, commodity_list: @purch_reqn_item.commodity_list, contract_flag: @purch_reqn_item.contract_flag, contract_item_reference_id: @purch_reqn_item.contract_item_reference_id, created_by_id: @purch_reqn_item.created_by_id, currency_id: @purch_reqn_item.currency_id, data: @purch_reqn_item.data, deleted_at: @purch_reqn_item.deleted_at, deleted_by_id: @purch_reqn_item.deleted_by_id, desc: @purch_reqn_item.desc, desired_vendor: @purch_reqn_item.desired_vendor, est_subtotal: @purch_reqn_item.est_subtotal, est_unit_price: @purch_reqn_item.est_unit_price, expected_delivery_date: @purch_reqn_item.expected_delivery_date, fixed_vendor: @purch_reqn_item.fixed_vendor, item_type: @purch_reqn_item.item_type, measurement_unit_id: @purch_reqn_item.measurement_unit_id, note: @purch_reqn_item.note, number: @purch_reqn_item.number, parent_id: @purch_reqn_item.parent_id, price_unit: @purch_reqn_item.price_unit, processed_qty: @purch_reqn_item.processed_qty, product_group_id: @purch_reqn_item.product_group_id, product_id: @purch_reqn_item.product_id, purch_reqn_id: @purch_reqn_item.purch_reqn_id, purch_reqn_item_noncontract_id: @purch_reqn_item.purch_reqn_item_noncontract_id, qty: @purch_reqn_item.qty, requisitioner: @purch_reqn_item.requisitioner, specification: @purch_reqn_item.specification, updated_by_id: @purch_reqn_item.updated_by_id, wbsproject_id: @purch_reqn_item.wbsproject_id } }
    end

    assert_redirected_to purch_reqn_item_url(PurchReqnItem.last)
  end

  test "should show purch_reqn_item" do
    get purch_reqn_item_url(@purch_reqn_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_item_url(@purch_reqn_item)
    assert_response :success
  end

  test "should update purch_reqn_item" do
    patch purch_reqn_item_url(@purch_reqn_item), params: { purch_reqn_item: { adjustment_qty: @purch_reqn_item.adjustment_qty, app_id: @purch_reqn_item.app_id, commodity_list: @purch_reqn_item.commodity_list, contract_flag: @purch_reqn_item.contract_flag, contract_item_reference_id: @purch_reqn_item.contract_item_reference_id, created_by_id: @purch_reqn_item.created_by_id, currency_id: @purch_reqn_item.currency_id, data: @purch_reqn_item.data, deleted_at: @purch_reqn_item.deleted_at, deleted_by_id: @purch_reqn_item.deleted_by_id, desc: @purch_reqn_item.desc, desired_vendor: @purch_reqn_item.desired_vendor, est_subtotal: @purch_reqn_item.est_subtotal, est_unit_price: @purch_reqn_item.est_unit_price, expected_delivery_date: @purch_reqn_item.expected_delivery_date, fixed_vendor: @purch_reqn_item.fixed_vendor, item_type: @purch_reqn_item.item_type, measurement_unit_id: @purch_reqn_item.measurement_unit_id, note: @purch_reqn_item.note, number: @purch_reqn_item.number, parent_id: @purch_reqn_item.parent_id, price_unit: @purch_reqn_item.price_unit, processed_qty: @purch_reqn_item.processed_qty, product_group_id: @purch_reqn_item.product_group_id, product_id: @purch_reqn_item.product_id, purch_reqn_id: @purch_reqn_item.purch_reqn_id, purch_reqn_item_noncontract_id: @purch_reqn_item.purch_reqn_item_noncontract_id, qty: @purch_reqn_item.qty, requisitioner: @purch_reqn_item.requisitioner, specification: @purch_reqn_item.specification, updated_by_id: @purch_reqn_item.updated_by_id, wbsproject_id: @purch_reqn_item.wbsproject_id } }
    assert_redirected_to purch_reqn_item_url(@purch_reqn_item)
  end

  test "should destroy purch_reqn_item" do
    assert_difference("PurchReqnItem.count", -1) do
      delete purch_reqn_item_url(@purch_reqn_item)
    end

    assert_redirected_to purch_reqn_items_url
  end
end
