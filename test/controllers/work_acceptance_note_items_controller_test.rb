require "test_helper"

class WorkAcceptanceNoteItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_acceptance_note_item = work_acceptance_note_items(:one)
  end

  test "should get index" do
    get work_acceptance_note_items_url
    assert_response :success
  end

  test "should get new" do
    get new_work_acceptance_note_item_url
    assert_response :success
  end

  test "should create work_acceptance_note_item" do
    assert_difference("WorkAcceptanceNoteItem.count") do
      post work_acceptance_note_items_url, params: { work_acceptance_note_item: { amount_type: @work_acceptance_note_item.amount_type, commodity_list_id: @work_acceptance_note_item.commodity_list_id, cost_center_id: @work_acceptance_note_item.cost_center_id, data: @work_acceptance_note_item.data, deleted_at: @work_acceptance_note_item.deleted_at, delivery_date: @work_acceptance_note_item.delivery_date, desc: @work_acceptance_note_item.desc, from_amount: @work_acceptance_note_item.from_amount, from_currency_id: @work_acceptance_note_item.from_currency_id, measurement_unit_id: @work_acceptance_note_item.measurement_unit_id, note: @work_acceptance_note_item.note, number: @work_acceptance_note_item.number, parent_id: @work_acceptance_note_item.parent_id, price_unit: @work_acceptance_note_item.price_unit, process_qty: @work_acceptance_note_item.process_qty, process_unit_price: @work_acceptance_note_item.process_unit_price, product_group_id: @work_acceptance_note_item.product_group_id, product_id: @work_acceptance_note_item.product_id, purch_order_item_id: @work_acceptance_note_item.purch_order_item_id, qty: @work_acceptance_note_item.qty, sales_taxable: @work_acceptance_note_item.sales_taxable, specification: @work_acceptance_note_item.specification, subtotal: @work_acceptance_note_item.subtotal, to_amount: @work_acceptance_note_item.to_amount, to_currency_id: @work_acceptance_note_item.to_currency_id, unit_price: @work_acceptance_note_item.unit_price, wbsproject_id: @work_acceptance_note_item.wbsproject_id, work_acceptance_note_id: @work_acceptance_note_item.work_acceptance_note_id } }
    end

    assert_redirected_to work_acceptance_note_item_url(WorkAcceptanceNoteItem.last)
  end

  test "should show work_acceptance_note_item" do
    get work_acceptance_note_item_url(@work_acceptance_note_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_acceptance_note_item_url(@work_acceptance_note_item)
    assert_response :success
  end

  test "should update work_acceptance_note_item" do
    patch work_acceptance_note_item_url(@work_acceptance_note_item), params: { work_acceptance_note_item: { amount_type: @work_acceptance_note_item.amount_type, commodity_list_id: @work_acceptance_note_item.commodity_list_id, cost_center_id: @work_acceptance_note_item.cost_center_id, data: @work_acceptance_note_item.data, deleted_at: @work_acceptance_note_item.deleted_at, delivery_date: @work_acceptance_note_item.delivery_date, desc: @work_acceptance_note_item.desc, from_amount: @work_acceptance_note_item.from_amount, from_currency_id: @work_acceptance_note_item.from_currency_id, measurement_unit_id: @work_acceptance_note_item.measurement_unit_id, note: @work_acceptance_note_item.note, number: @work_acceptance_note_item.number, parent_id: @work_acceptance_note_item.parent_id, price_unit: @work_acceptance_note_item.price_unit, process_qty: @work_acceptance_note_item.process_qty, process_unit_price: @work_acceptance_note_item.process_unit_price, product_group_id: @work_acceptance_note_item.product_group_id, product_id: @work_acceptance_note_item.product_id, purch_order_item_id: @work_acceptance_note_item.purch_order_item_id, qty: @work_acceptance_note_item.qty, sales_taxable: @work_acceptance_note_item.sales_taxable, specification: @work_acceptance_note_item.specification, subtotal: @work_acceptance_note_item.subtotal, to_amount: @work_acceptance_note_item.to_amount, to_currency_id: @work_acceptance_note_item.to_currency_id, unit_price: @work_acceptance_note_item.unit_price, wbsproject_id: @work_acceptance_note_item.wbsproject_id, work_acceptance_note_id: @work_acceptance_note_item.work_acceptance_note_id } }
    assert_redirected_to work_acceptance_note_item_url(@work_acceptance_note_item)
  end

  test "should destroy work_acceptance_note_item" do
    assert_difference("WorkAcceptanceNoteItem.count", -1) do
      delete work_acceptance_note_item_url(@work_acceptance_note_item)
    end

    assert_redirected_to work_acceptance_note_items_url
  end
end
