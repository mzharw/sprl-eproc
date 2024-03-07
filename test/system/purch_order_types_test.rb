require "application_system_test_case"

class PurchOrderTypesTest < ApplicationSystemTestCase
  setup do
    @purch_order_type = purch_order_types(:one)
  end

  test "visiting the index" do
    visit purch_order_types_url
    assert_selector "h1", text: "Purch order types"
  end

  test "should create purch order type" do
    visit purch_order_types_url
    click_on "New purch order type"

    fill_in "Desc", with: @purch_order_type.desc
    fill_in "Ident name", with: @purch_order_type.ident_name
    fill_in "Name", with: @purch_order_type.name
    check "System" if @purch_order_type.system
    click_on "Create Purch order type"

    assert_text "Purch order type was successfully created"
    click_on "Back"
  end

  test "should update Purch order type" do
    visit purch_order_type_url(@purch_order_type)
    click_on "Edit this purch order type", match: :first

    fill_in "Desc", with: @purch_order_type.desc
    fill_in "Ident name", with: @purch_order_type.ident_name
    fill_in "Name", with: @purch_order_type.name
    check "System" if @purch_order_type.system
    click_on "Update Purch order type"

    assert_text "Purch order type was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch order type" do
    visit purch_order_type_url(@purch_order_type)
    click_on "Destroy this purch order type", match: :first

    assert_text "Purch order type was successfully destroyed"
  end
end
