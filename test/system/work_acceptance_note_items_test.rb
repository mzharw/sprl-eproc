require "application_system_test_case"

class WorkAcceptanceNoteItemsTest < ApplicationSystemTestCase
  setup do
    @work_acceptance_note_item = work_acceptance_note_items(:one)
  end

  test "visiting the index" do
    visit work_acceptance_note_items_url
    assert_selector "h1", text: "Work acceptance note items"
  end

  test "should create work acceptance note item" do
    visit work_acceptance_note_items_url
    click_on "New work acceptance note item"

    fill_in "Amount type", with: @work_acceptance_note_item.amount_type
    fill_in "Commodity list", with: @work_acceptance_note_item.commodity_list_id
    fill_in "Cost center", with: @work_acceptance_note_item.cost_center_id
    fill_in "Data", with: @work_acceptance_note_item.data
    fill_in "Deleted at", with: @work_acceptance_note_item.deleted_at
    fill_in "Delivery date", with: @work_acceptance_note_item.delivery_date
    fill_in "Desc", with: @work_acceptance_note_item.desc
    fill_in "From amount", with: @work_acceptance_note_item.from_amount
    fill_in "From currency", with: @work_acceptance_note_item.from_currency_id
    fill_in "Measurement unit", with: @work_acceptance_note_item.measurement_unit_id
    fill_in "Note", with: @work_acceptance_note_item.note
    fill_in "Number", with: @work_acceptance_note_item.number
    fill_in "Parent", with: @work_acceptance_note_item.parent_id
    fill_in "Price unit", with: @work_acceptance_note_item.price_unit
    fill_in "Process qty", with: @work_acceptance_note_item.process_qty
    fill_in "Process unit price", with: @work_acceptance_note_item.process_unit_price
    fill_in "Product group", with: @work_acceptance_note_item.product_group_id
    fill_in "Product", with: @work_acceptance_note_item.product_id
    fill_in "Purch order item", with: @work_acceptance_note_item.purch_order_item_id
    fill_in "Qty", with: @work_acceptance_note_item.qty
    check "Sales taxable" if @work_acceptance_note_item.sales_taxable
    fill_in "Specification", with: @work_acceptance_note_item.specification
    fill_in "Subtotal", with: @work_acceptance_note_item.subtotal
    fill_in "To amount", with: @work_acceptance_note_item.to_amount
    fill_in "To currency", with: @work_acceptance_note_item.to_currency_id
    fill_in "Unit price", with: @work_acceptance_note_item.unit_price
    fill_in "Wbsproject", with: @work_acceptance_note_item.wbsproject_id
    fill_in "Work acceptance note", with: @work_acceptance_note_item.work_acceptance_note_id
    click_on "Create Work acceptance note item"

    assert_text "Work acceptance note item was successfully created"
    click_on "Back"
  end

  test "should update Work acceptance note item" do
    visit work_acceptance_note_item_url(@work_acceptance_note_item)
    click_on "Edit this work acceptance note item", match: :first

    fill_in "Amount type", with: @work_acceptance_note_item.amount_type
    fill_in "Commodity list", with: @work_acceptance_note_item.commodity_list_id
    fill_in "Cost center", with: @work_acceptance_note_item.cost_center_id
    fill_in "Data", with: @work_acceptance_note_item.data
    fill_in "Deleted at", with: @work_acceptance_note_item.deleted_at
    fill_in "Delivery date", with: @work_acceptance_note_item.delivery_date
    fill_in "Desc", with: @work_acceptance_note_item.desc
    fill_in "From amount", with: @work_acceptance_note_item.from_amount
    fill_in "From currency", with: @work_acceptance_note_item.from_currency_id
    fill_in "Measurement unit", with: @work_acceptance_note_item.measurement_unit_id
    fill_in "Note", with: @work_acceptance_note_item.note
    fill_in "Number", with: @work_acceptance_note_item.number
    fill_in "Parent", with: @work_acceptance_note_item.parent_id
    fill_in "Price unit", with: @work_acceptance_note_item.price_unit
    fill_in "Process qty", with: @work_acceptance_note_item.process_qty
    fill_in "Process unit price", with: @work_acceptance_note_item.process_unit_price
    fill_in "Product group", with: @work_acceptance_note_item.product_group_id
    fill_in "Product", with: @work_acceptance_note_item.product_id
    fill_in "Purch order item", with: @work_acceptance_note_item.purch_order_item_id
    fill_in "Qty", with: @work_acceptance_note_item.qty
    check "Sales taxable" if @work_acceptance_note_item.sales_taxable
    fill_in "Specification", with: @work_acceptance_note_item.specification
    fill_in "Subtotal", with: @work_acceptance_note_item.subtotal
    fill_in "To amount", with: @work_acceptance_note_item.to_amount
    fill_in "To currency", with: @work_acceptance_note_item.to_currency_id
    fill_in "Unit price", with: @work_acceptance_note_item.unit_price
    fill_in "Wbsproject", with: @work_acceptance_note_item.wbsproject_id
    fill_in "Work acceptance note", with: @work_acceptance_note_item.work_acceptance_note_id
    click_on "Update Work acceptance note item"

    assert_text "Work acceptance note item was successfully updated"
    click_on "Back"
  end

  test "should destroy Work acceptance note item" do
    visit work_acceptance_note_item_url(@work_acceptance_note_item)
    click_on "Destroy this work acceptance note item", match: :first

    assert_text "Work acceptance note item was successfully destroyed"
  end
end
