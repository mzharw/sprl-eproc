require "application_system_test_case"

class VendorsTest < ApplicationSystemTestCase
  setup do
    @vendor = vendors(:one)
  end

  test "visiting the index" do
    visit vendors_url
    assert_selector "h1", text: "Vendors"
  end

  test "should create vendor" do
    visit vendors_url
    click_on "New vendor"

    fill_in "Active vendor status", with: @vendor.active_vendor_status_id
    fill_in "Code", with: @vendor.code
    fill_in "Created at", with: @vendor.created_at
    fill_in "Created by", with: @vendor.created_by_id
    fill_in "Data", with: @vendor.data
    fill_in "From date", with: @vendor.from_date
    fill_in "State", with: @vendor.state
    fill_in "Thru date", with: @vendor.thru_date
    fill_in "Updated at", with: @vendor.updated_at
    fill_in "Updated by", with: @vendor.updated_by_id
    fill_in "Vendor type", with: @vendor.vendor_type_id
    click_on "Create Vendor"

    assert_text "Vendor was successfully created"
    click_on "Back"
  end

  test "should update Vendor" do
    visit vendor_url(@vendor)
    click_on "Edit this vendor", match: :first

    fill_in "Active vendor status", with: @vendor.active_vendor_status_id
    fill_in "Code", with: @vendor.code
    fill_in "Created at", with: @vendor.created_at
    fill_in "Created by", with: @vendor.created_by_id
    fill_in "Data", with: @vendor.data
    fill_in "From date", with: @vendor.from_date
    fill_in "State", with: @vendor.state
    fill_in "Thru date", with: @vendor.thru_date
    fill_in "Updated at", with: @vendor.updated_at
    fill_in "Updated by", with: @vendor.updated_by_id
    fill_in "Vendor type", with: @vendor.vendor_type_id
    click_on "Update Vendor"

    assert_text "Vendor was successfully updated"
    click_on "Back"
  end

  test "should destroy Vendor" do
    visit vendor_url(@vendor)
    click_on "Destroy this vendor", match: :first

    assert_text "Vendor was successfully destroyed"
  end
end
