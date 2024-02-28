require "application_system_test_case"

class PurchReqnItemsTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_item = purch_reqn_items(:one)
  end

  test "visiting the index" do
    visit purch_reqn_items_url
    assert_selector "h1", text: "Purch reqn items"
  end

  test "should create purch reqn item" do
    visit purch_reqn_items_url
    click_on "New purch reqn item"

    fill_in "Adjustment qty", with: @purch_reqn_item.adjustment_qty
    fill_in "Commodity list", with: @purch_reqn_item.commodity_list
    check "Contract flag" if @purch_reqn_item.contract_flag
    fill_in "Contract item reference", with: @purch_reqn_item.contract_item_reference_id
    fill_in "Created by", with: @purch_reqn_item.created_by_id
    fill_in "Currency", with: @purch_reqn_item.currency_id
    fill_in "Data", with: @purch_reqn_item.data
    fill_in "Deleted at", with: @purch_reqn_item.deleted_at
    fill_in "Deleted by", with: @purch_reqn_item.discarded_by_id
    fill_in "Desc", with: @purch_reqn_item.desc
    fill_in "Desired vendor", with: @purch_reqn_item.desired_vendor
    fill_in "Est subtotal", with: @purch_reqn_item.est_subtotal
    fill_in "Est unit price", with: @purch_reqn_item.est_unit_price
    fill_in "Expected delivery date", with: @purch_reqn_item.expected_delivery_date
    fill_in "Fixed vendor", with: @purch_reqn_item.fixed_vendor
    fill_in "Item type", with: @purch_reqn_item.item_type
    fill_in "Measurement unit", with: @purch_reqn_item.measurement_unit_id
    fill_in "Note", with: @purch_reqn_item.note
    fill_in "Number", with: @purch_reqn_item.number
    fill_in "Parent", with: @purch_reqn_item.parent_id
    fill_in "Price unit", with: @purch_reqn_item.price_unit
    fill_in "Processed qty", with: @purch_reqn_item.processed_qty
    fill_in "Product group", with: @purch_reqn_item.product_group_id
    fill_in "Product", with: @purch_reqn_item.product_id
    fill_in "Purch reqn", with: @purch_reqn_item.purch_reqn_id
    fill_in "Purch reqn item noncontract", with: @purch_reqn_item.purch_reqn_item_noncontract_id
    fill_in "Qty", with: @purch_reqn_item.qty
    fill_in "Requisitioner", with: @purch_reqn_item.requisitioner
    fill_in "Specification", with: @purch_reqn_item.specification
    fill_in "Updated by", with: @purch_reqn_item.updated_by_id
    fill_in "Wbsproject", with: @purch_reqn_item.wbsproject_id
    click_on "Create Purch reqn item"

    assert_text "Purch reqn item was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn item" do
    visit purch_reqn_item_url(@purch_reqn_item)
    click_on "Edit this purch reqn item", match: :first

    fill_in "Adjustment qty", with: @purch_reqn_item.adjustment_qty
    fill_in "Commodity list", with: @purch_reqn_item.commodity_list
    check "Contract flag" if @purch_reqn_item.contract_flag
    fill_in "Contract item reference", with: @purch_reqn_item.contract_item_reference_id
    fill_in "Created by", with: @purch_reqn_item.created_by_id
    fill_in "Currency", with: @purch_reqn_item.currency_id
    fill_in "Data", with: @purch_reqn_item.data
    fill_in "Deleted at", with: @purch_reqn_item.deleted_at
    fill_in "Deleted by", with: @purch_reqn_item.discarded_by_id
    fill_in "Desc", with: @purch_reqn_item.desc
    fill_in "Desired vendor", with: @purch_reqn_item.desired_vendor
    fill_in "Est subtotal", with: @purch_reqn_item.est_subtotal
    fill_in "Est unit price", with: @purch_reqn_item.est_unit_price
    fill_in "Expected delivery date", with: @purch_reqn_item.expected_delivery_date
    fill_in "Fixed vendor", with: @purch_reqn_item.fixed_vendor
    fill_in "Item type", with: @purch_reqn_item.item_type
    fill_in "Measurement unit", with: @purch_reqn_item.measurement_unit_id
    fill_in "Note", with: @purch_reqn_item.note
    fill_in "Number", with: @purch_reqn_item.number
    fill_in "Parent", with: @purch_reqn_item.parent_id
    fill_in "Price unit", with: @purch_reqn_item.price_unit
    fill_in "Processed qty", with: @purch_reqn_item.processed_qty
    fill_in "Product group", with: @purch_reqn_item.product_group_id
    fill_in "Product", with: @purch_reqn_item.product_id
    fill_in "Purch reqn", with: @purch_reqn_item.purch_reqn_id
    fill_in "Purch reqn item noncontract", with: @purch_reqn_item.purch_reqn_item_noncontract_id
    fill_in "Qty", with: @purch_reqn_item.qty
    fill_in "Requisitioner", with: @purch_reqn_item.requisitioner
    fill_in "Specification", with: @purch_reqn_item.specification
    fill_in "Updated by", with: @purch_reqn_item.updated_by_id
    fill_in "Wbsproject", with: @purch_reqn_item.wbsproject_id
    click_on "Update Purch reqn item"

    assert_text "Purch reqn item was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn item" do
    visit purch_reqn_item_url(@purch_reqn_item)
    click_on "Destroy this purch reqn item", match: :first

    assert_text "Purch reqn item was successfully destroyed"
  end
end
