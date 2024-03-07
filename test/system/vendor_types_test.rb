require "application_system_test_case"

class VendorTypesTest < ApplicationSystemTestCase
  setup do
    @vendor_type = vendor_types(:one)
  end

  test "visiting the index" do
    visit vendor_types_url
    assert_selector "h1", text: "Vendor types"
  end

  test "should create vendor type" do
    visit vendor_types_url
    click_on "New vendor type"

    fill_in "Created at", with: @vendor_type.created_at
    fill_in "Created by", with: @vendor_type.created_by_id
    fill_in "Desc", with: @vendor_type.desc
    fill_in "Ident name", with: @vendor_type.ident_name
    fill_in "Name", with: @vendor_type.name
    check "System" if @vendor_type.system
    fill_in "Updated at", with: @vendor_type.updated_at
    fill_in "Updated by", with: @vendor_type.updated_by_id
    click_on "Create Vendor type"

    assert_text "Vendor type was successfully created"
    click_on "Back"
  end

  test "should update Vendor type" do
    visit vendor_type_url(@vendor_type)
    click_on "Edit this vendor type", match: :first

    fill_in "Created at", with: @vendor_type.created_at
    fill_in "Created by", with: @vendor_type.created_by_id
    fill_in "Desc", with: @vendor_type.desc
    fill_in "Ident name", with: @vendor_type.ident_name
    fill_in "Name", with: @vendor_type.name
    check "System" if @vendor_type.system
    fill_in "Updated at", with: @vendor_type.updated_at
    fill_in "Updated by", with: @vendor_type.updated_by_id
    click_on "Update Vendor type"

    assert_text "Vendor type was successfully updated"
    click_on "Back"
  end

  test "should destroy Vendor type" do
    visit vendor_type_url(@vendor_type)
    click_on "Destroy this vendor type", match: :first

    assert_text "Vendor type was successfully destroyed"
  end
end
