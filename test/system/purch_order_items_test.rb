require "application_system_test_case"

class PurchOrderItemsTest < ApplicationSystemTestCase
  setup do
    @purch_order_item = purch_order_items(:one)
  end

  test "visiting the index" do
    visit purch_order_items_url
    assert_selector "h1", text: "Purch order items"
  end

  test "should create purch order item" do
    visit purch_order_items_url
    click_on "New purch order item"

    fill_in "Amount type", with: @purch_order_item.amount_type
    fill_in "Ancestry", with: @purch_order_item.ancestry
    fill_in "Ancestry depth", with: @purch_order_item.ancestry_depth
    fill_in "Cost center", with: @purch_order_item.cost_center
    fill_in "Created by", with: @purch_order_item.created_by
    fill_in "Data", with: @purch_order_item.data
    fill_in "Delivery date", with: @purch_order_item.delivery_date
    fill_in "Desc", with: @purch_order_item.desc
    fill_in "From amount", with: @purch_order_item.from_amount
    fill_in "From currency", with: @purch_order_item.from_currency
    fill_in "Item type", with: @purch_order_item.item_type
    fill_in "Line total", with: @purch_order_item.line_total
    fill_in "Measurement unit", with: @purch_order_item.measurement_unit
    fill_in "Note", with: @purch_order_item.note
    fill_in "Number", with: @purch_order_item.number
    fill_in "Parent", with: @purch_order_item.parent
    fill_in "Prcmt item", with: @purch_order_item.prcmt_item
    fill_in "Price unit", with: @purch_order_item.price_unit
    fill_in "Process qty", with: @purch_order_item.process_qty
    fill_in "Process unit price", with: @purch_order_item.process_unit_price
    fill_in "Product", with: @purch_order_item.product
    fill_in "Product group", with: @purch_order_item.product_group
    fill_in "Purch order", with: @purch_order_item.purch_order
    fill_in "Purch order item type", with: @purch_order_item.purch_order_item_type
    fill_in "Purch reqn item", with: @purch_order_item.purch_reqn_item
    fill_in "Qty", with: @purch_order_item.qty
    check "Sales taxable" if @purch_order_item.sales_taxable
    fill_in "Seq", with: @purch_order_item.seq
    fill_in "Specification", with: @purch_order_item.specification
    fill_in "Subtotal", with: @purch_order_item.subtotal
    fill_in "To amount", with: @purch_order_item.to_amount
    fill_in "To currency", with: @purch_order_item.to_currency
    fill_in "Unit price", with: @purch_order_item.unit_price
    fill_in "Updated by", with: @purch_order_item.updated_by
    fill_in "Wbsproject", with: @purch_order_item.wbsproject
    click_on "Create Purch order item"

    assert_text "Purch order item was successfully created"
    click_on "Back"
  end

  test "should update Purch order item" do
    visit purch_order_item_url(@purch_order_item)
    click_on "Edit this purch order item", match: :first

    fill_in "Amount type", with: @purch_order_item.amount_type
    fill_in "Ancestry", with: @purch_order_item.ancestry
    fill_in "Ancestry depth", with: @purch_order_item.ancestry_depth
    fill_in "Cost center", with: @purch_order_item.cost_center
    fill_in "Created by", with: @purch_order_item.created_by
    fill_in "Data", with: @purch_order_item.data
    fill_in "Delivery date", with: @purch_order_item.delivery_date
    fill_in "Desc", with: @purch_order_item.desc
    fill_in "From amount", with: @purch_order_item.from_amount
    fill_in "From currency", with: @purch_order_item.from_currency
    fill_in "Item type", with: @purch_order_item.item_type
    fill_in "Line total", with: @purch_order_item.line_total
    fill_in "Measurement unit", with: @purch_order_item.measurement_unit
    fill_in "Note", with: @purch_order_item.note
    fill_in "Number", with: @purch_order_item.number
    fill_in "Parent", with: @purch_order_item.parent
    fill_in "Prcmt item", with: @purch_order_item.prcmt_item
    fill_in "Price unit", with: @purch_order_item.price_unit
    fill_in "Process qty", with: @purch_order_item.process_qty
    fill_in "Process unit price", with: @purch_order_item.process_unit_price
    fill_in "Product", with: @purch_order_item.product
    fill_in "Product group", with: @purch_order_item.product_group
    fill_in "Purch order", with: @purch_order_item.purch_order
    fill_in "Purch order item type", with: @purch_order_item.purch_order_item_type
    fill_in "Purch reqn item", with: @purch_order_item.purch_reqn_item
    fill_in "Qty", with: @purch_order_item.qty
    check "Sales taxable" if @purch_order_item.sales_taxable
    fill_in "Seq", with: @purch_order_item.seq
    fill_in "Specification", with: @purch_order_item.specification
    fill_in "Subtotal", with: @purch_order_item.subtotal
    fill_in "To amount", with: @purch_order_item.to_amount
    fill_in "To currency", with: @purch_order_item.to_currency
    fill_in "Unit price", with: @purch_order_item.unit_price
    fill_in "Updated by", with: @purch_order_item.updated_by
    fill_in "Wbsproject", with: @purch_order_item.wbsproject
    click_on "Update Purch order item"

    assert_text "Purch order item was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch order item" do
    visit purch_order_item_url(@purch_order_item)
    click_on "Destroy this purch order item", match: :first

    assert_text "Purch order item was successfully destroyed"
  end
end
