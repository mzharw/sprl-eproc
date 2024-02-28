require "test_helper"

class PrcmtItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prcmt_item = prcmt_items(:one)
  end

  test "should get index" do
    get prcmt_items_url
    assert_response :success
  end

  test "should get new" do
    get new_prcmt_item_url
    assert_response :success
  end

  test "should create prcmt_item" do
    assert_difference("PrcmtItem.count") do
      post prcmt_items_url, params: { prcmt_item: { awarded_at: @prcmt_item.awarded_at, currency_id: @prcmt_item.currency_id, data: @prcmt_item.data, desc: @prcmt_item.desc, desired_vendor: @prcmt_item.desired_vendor, est_subtotal: @prcmt_item.est_subtotal, est_unit_price: @prcmt_item.est_unit_price, expected_delivery_date: @prcmt_item.expected_delivery_date, fixed_vendor: @prcmt_item.fixed_vendor, measurement_unit_id: @prcmt_item.measurement_unit_id, note: @prcmt_item.note, number: @prcmt_item.number, po_processed: @prcmt_item.po_processed, prcmt_award_item_id: @prcmt_item.prcmt_award_item_id, prcmt_id: @prcmt_item.prcmt_id, price_unit: @prcmt_item.price_unit, product_group_id: @prcmt_item.product_group_id, product_id: @prcmt_item.product_id, purch_group_id: @prcmt_item.purch_group_id, purch_reqn_item_id: @prcmt_item.purch_reqn_item_id, qty: @prcmt_item.qty, requisitioner: @prcmt_item.requisitioner, specification: @prcmt_item.specification, state: @prcmt_item.state } }
    end

    assert_redirected_to prcmt_item_url(PrcmtItem.last)
  end

  test "should show prcmt_item" do
    get prcmt_item_url(@prcmt_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_prcmt_item_url(@prcmt_item)
    assert_response :success
  end

  test "should update prcmt_item" do
    patch prcmt_item_url(@prcmt_item), params: { prcmt_item: { awarded_at: @prcmt_item.awarded_at, currency_id: @prcmt_item.currency_id, data: @prcmt_item.data, desc: @prcmt_item.desc, desired_vendor: @prcmt_item.desired_vendor, est_subtotal: @prcmt_item.est_subtotal, est_unit_price: @prcmt_item.est_unit_price, expected_delivery_date: @prcmt_item.expected_delivery_date, fixed_vendor: @prcmt_item.fixed_vendor, measurement_unit_id: @prcmt_item.measurement_unit_id, note: @prcmt_item.note, number: @prcmt_item.number, po_processed: @prcmt_item.po_processed, prcmt_award_item_id: @prcmt_item.prcmt_award_item_id, prcmt_id: @prcmt_item.prcmt_id, price_unit: @prcmt_item.price_unit, product_group_id: @prcmt_item.product_group_id, product_id: @prcmt_item.product_id, purch_group_id: @prcmt_item.purch_group_id, purch_reqn_item_id: @prcmt_item.purch_reqn_item_id, qty: @prcmt_item.qty, requisitioner: @prcmt_item.requisitioner, specification: @prcmt_item.specification, state: @prcmt_item.state } }
    assert_redirected_to prcmt_item_url(@prcmt_item)
  end

  test "should destroy prcmt_item" do
    assert_difference("PrcmtItem.count", -1) do
      delete prcmt_item_url(@prcmt_item)
    end

    assert_redirected_to prcmt_items_url
  end
end
