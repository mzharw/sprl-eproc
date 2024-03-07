require "test_helper"

class PurchOrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_order_item = purch_order_items(:one)
  end

  test "should get index" do
    get purch_order_items_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_order_item_url
    assert_response :success
  end

  test "should create purch_order_item" do
    assert_difference("PurchOrderItem.count") do
      post purch_order_items_url, params: { purch_order_item: { amount_type: @purch_order_item.amount_type, ancestry: @purch_order_item.ancestry, ancestry_depth: @purch_order_item.ancestry_depth, cost_center: @purch_order_item.cost_center, created_by: @purch_order_item.created_by, data: @purch_order_item.data, delivery_date: @purch_order_item.delivery_date, desc: @purch_order_item.desc, from_amount: @purch_order_item.from_amount, from_currency: @purch_order_item.from_currency, item_type: @purch_order_item.item_type, line_total: @purch_order_item.line_total, measurement_unit: @purch_order_item.measurement_unit, note: @purch_order_item.note, number: @purch_order_item.number, parent: @purch_order_item.parent, prcmt_item: @purch_order_item.prcmt_item, price_unit: @purch_order_item.price_unit, process_qty: @purch_order_item.process_qty, process_unit_price: @purch_order_item.process_unit_price, product: @purch_order_item.product, product_group: @purch_order_item.product_group, purch_order: @purch_order_item.purch_order, purch_order_item_type: @purch_order_item.purch_order_item_type, purch_reqn_item: @purch_order_item.purch_reqn_item, qty: @purch_order_item.qty, sales_taxable: @purch_order_item.sales_taxable, seq: @purch_order_item.seq, specification: @purch_order_item.specification, subtotal: @purch_order_item.subtotal, to_amount: @purch_order_item.to_amount, to_currency: @purch_order_item.to_currency, unit_price: @purch_order_item.unit_price, updated_by: @purch_order_item.updated_by, wbsproject: @purch_order_item.wbsproject } }
    end

    assert_redirected_to purch_order_item_url(PurchOrderItem.last)
  end

  test "should show purch_order_item" do
    get purch_order_item_url(@purch_order_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_order_item_url(@purch_order_item)
    assert_response :success
  end

  test "should update purch_order_item" do
    patch purch_order_item_url(@purch_order_item), params: { purch_order_item: { amount_type: @purch_order_item.amount_type, ancestry: @purch_order_item.ancestry, ancestry_depth: @purch_order_item.ancestry_depth, cost_center: @purch_order_item.cost_center, created_by: @purch_order_item.created_by, data: @purch_order_item.data, delivery_date: @purch_order_item.delivery_date, desc: @purch_order_item.desc, from_amount: @purch_order_item.from_amount, from_currency: @purch_order_item.from_currency, item_type: @purch_order_item.item_type, line_total: @purch_order_item.line_total, measurement_unit: @purch_order_item.measurement_unit, note: @purch_order_item.note, number: @purch_order_item.number, parent: @purch_order_item.parent, prcmt_item: @purch_order_item.prcmt_item, price_unit: @purch_order_item.price_unit, process_qty: @purch_order_item.process_qty, process_unit_price: @purch_order_item.process_unit_price, product: @purch_order_item.product, product_group: @purch_order_item.product_group, purch_order: @purch_order_item.purch_order, purch_order_item_type: @purch_order_item.purch_order_item_type, purch_reqn_item: @purch_order_item.purch_reqn_item, qty: @purch_order_item.qty, sales_taxable: @purch_order_item.sales_taxable, seq: @purch_order_item.seq, specification: @purch_order_item.specification, subtotal: @purch_order_item.subtotal, to_amount: @purch_order_item.to_amount, to_currency: @purch_order_item.to_currency, unit_price: @purch_order_item.unit_price, updated_by: @purch_order_item.updated_by, wbsproject: @purch_order_item.wbsproject } }
    assert_redirected_to purch_order_item_url(@purch_order_item)
  end

  test "should destroy purch_order_item" do
    assert_difference("PurchOrderItem.count", -1) do
      delete purch_order_item_url(@purch_order_item)
    end

    assert_redirected_to purch_order_items_url
  end
end
