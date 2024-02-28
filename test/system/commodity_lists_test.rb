require "application_system_test_case"

class CommodityListsTest < ApplicationSystemTestCase
  setup do
    @commodity_list = commodity_lists(:one)
  end

  test "visiting the index" do
    visit commodity_lists_url
    assert_selector "h1", text: "Commodity lists"
  end

  test "should create commodity list" do
    visit commodity_lists_url
    click_on "New commodity list"

    fill_in "Commodity list", with: @commodity_list.commodity_list_id
    fill_in "Created by", with: @commodity_list.created_by_id
    fill_in "Desc", with: @commodity_list.description
    fill_in "Number", with: @commodity_list.number
    fill_in "Updated by", with: @commodity_list.updated_by_id
    click_on "Create Commodity list"

    assert_text "Commodity list was successfully created"
    click_on "Back"
  end

  test "should update Commodity list" do
    visit commodity_list_url(@commodity_list)
    click_on "Edit this commodity list", match: :first

    fill_in "Commodity list", with: @commodity_list.commodity_list_id
    fill_in "Created by", with: @commodity_list.created_by_id
    fill_in "Desc", with: @commodity_list.description
    fill_in "Number", with: @commodity_list.number
    fill_in "Updated by", with: @commodity_list.updated_by_id
    click_on "Update Commodity list"

    assert_text "Commodity list was successfully updated"
    click_on "Back"
  end

  test "should destroy Commodity list" do
    visit commodity_list_url(@commodity_list)
    click_on "Destroy this commodity list", match: :first

    assert_text "Commodity list was successfully destroyed"
  end
end
