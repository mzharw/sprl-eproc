require "application_system_test_case"

class PrcmtItemsTest < ApplicationSystemTestCase
  setup do
    @prcmt_item = prcmt_items(:one)
  end

  test "visiting the index" do
    visit prcmt_items_url
    assert_selector "h1", text: "Prcmt items"
  end

  test "should create prcmt item" do
    visit prcmt_items_url
    click_on "New prcmt item"

    fill_in "Awarded at", with: @prcmt_item.awarded_at
    fill_in "Currency", with: @prcmt_item.currency_id
    fill_in "Data", with: @prcmt_item.data
    fill_in "Desc", with: @prcmt_item.desc
    fill_in "Desired vendor", with: @prcmt_item.desired_vendor
    fill_in "Est subtotal", with: @prcmt_item.est_subtotal
    fill_in "Est unit price", with: @prcmt_item.est_unit_price
    fill_in "Expected delivery date", with: @prcmt_item.expected_delivery_date
    fill_in "Fixed vendor", with: @prcmt_item.fixed_vendor
    fill_in "Measurement unit", with: @prcmt_item.measurement_unit_id
    fill_in "Note", with: @prcmt_item.note
    fill_in "Number", with: @prcmt_item.number
    check "Po processed" if @prcmt_item.po_processed
    fill_in "Prcmt award item", with: @prcmt_item.prcmt_award_item_id
    fill_in "Prcmt", with: @prcmt_item.prcmt_id
    fill_in "Price unit", with: @prcmt_item.price_unit
    fill_in "Product group", with: @prcmt_item.product_group_id
    fill_in "Product", with: @prcmt_item.product_id
    fill_in "Purch group", with: @prcmt_item.purch_group_id
    fill_in "Purch reqn item", with: @prcmt_item.purch_reqn_item_id
    fill_in "Qty", with: @prcmt_item.qty
    fill_in "Requisitioner", with: @prcmt_item.requisitioner
    fill_in "Specification", with: @prcmt_item.specification
    fill_in "State", with: @prcmt_item.state
    click_on "Create Prcmt item"

    assert_text "Prcmt item was successfully created"
    click_on "Back"
  end

  test "should update Prcmt item" do
    visit prcmt_item_url(@prcmt_item)
    click_on "Edit this prcmt item", match: :first

    fill_in "Awarded at", with: @prcmt_item.awarded_at
    fill_in "Currency", with: @prcmt_item.currency_id
    fill_in "Data", with: @prcmt_item.data
    fill_in "Desc", with: @prcmt_item.desc
    fill_in "Desired vendor", with: @prcmt_item.desired_vendor
    fill_in "Est subtotal", with: @prcmt_item.est_subtotal
    fill_in "Est unit price", with: @prcmt_item.est_unit_price
    fill_in "Expected delivery date", with: @prcmt_item.expected_delivery_date
    fill_in "Fixed vendor", with: @prcmt_item.fixed_vendor
    fill_in "Measurement unit", with: @prcmt_item.measurement_unit_id
    fill_in "Note", with: @prcmt_item.note
    fill_in "Number", with: @prcmt_item.number
    check "Po processed" if @prcmt_item.po_processed
    fill_in "Prcmt award item", with: @prcmt_item.prcmt_award_item_id
    fill_in "Prcmt", with: @prcmt_item.prcmt_id
    fill_in "Price unit", with: @prcmt_item.price_unit
    fill_in "Product group", with: @prcmt_item.product_group_id
    fill_in "Product", with: @prcmt_item.product_id
    fill_in "Purch group", with: @prcmt_item.purch_group_id
    fill_in "Purch reqn item", with: @prcmt_item.purch_reqn_item_id
    fill_in "Qty", with: @prcmt_item.qty
    fill_in "Requisitioner", with: @prcmt_item.requisitioner
    fill_in "Specification", with: @prcmt_item.specification
    fill_in "State", with: @prcmt_item.state
    click_on "Update Prcmt item"

    assert_text "Prcmt item was successfully updated"
    click_on "Back"
  end

  test "should destroy Prcmt item" do
    visit prcmt_item_url(@prcmt_item)
    click_on "Destroy this prcmt item", match: :first

    assert_text "Prcmt item was successfully destroyed"
  end
end
