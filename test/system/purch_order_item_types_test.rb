require "application_system_test_case"

class PurchOrderItemTypesTest < ApplicationSystemTestCase
  setup do
    @purch_order_item_type = purch_order_item_types(:one)
  end

  test "visiting the index" do
    visit purch_order_item_types_url
    assert_selector "h1", text: "Purch order item types"
  end

  test "should create purch order item type" do
    visit purch_order_item_types_url
    click_on "New purch order item type"

    check "Children allowed" if @purch_order_item_type.children_allowed
    fill_in "Desc", with: @purch_order_item_type.desc
    fill_in "Ident name", with: @purch_order_item_type.ident_name
    fill_in "Name", with: @purch_order_item_type.name
    fill_in "Parent", with: @purch_order_item_type.parent_id
    check "Sales taxable" if @purch_order_item_type.sales_taxable
    fill_in "Seq", with: @purch_order_item_type.seq
    fill_in "Sign", with: @purch_order_item_type.sign
    check "System" if @purch_order_item_type.system
    click_on "Create Purch order item type"

    assert_text "Purch order item type was successfully created"
    click_on "Back"
  end

  test "should update Purch order item type" do
    visit purch_order_item_type_url(@purch_order_item_type)
    click_on "Edit this purch order item type", match: :first

    check "Children allowed" if @purch_order_item_type.children_allowed
    fill_in "Desc", with: @purch_order_item_type.desc
    fill_in "Ident name", with: @purch_order_item_type.ident_name
    fill_in "Name", with: @purch_order_item_type.name
    fill_in "Parent", with: @purch_order_item_type.parent_id
    check "Sales taxable" if @purch_order_item_type.sales_taxable
    fill_in "Seq", with: @purch_order_item_type.seq
    fill_in "Sign", with: @purch_order_item_type.sign
    check "System" if @purch_order_item_type.system
    click_on "Update Purch order item type"

    assert_text "Purch order item type was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch order item type" do
    visit purch_order_item_type_url(@purch_order_item_type)
    click_on "Destroy this purch order item type", match: :first

    assert_text "Purch order item type was successfully destroyed"
  end
end
