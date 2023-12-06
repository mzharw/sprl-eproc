require "application_system_test_case"

class PurchReqnLinkTypesTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_link_type = purch_reqn_link_types(:one)
  end

  test "visiting the index" do
    visit purch_reqn_link_types_url
    assert_selector "h1", text: "Purch reqn link types"
  end

  test "should create purch reqn link type" do
    visit purch_reqn_link_types_url
    click_on "New purch reqn link type"

    fill_in "App", with: @purch_reqn_link_type.app_id
    fill_in "Created by", with: @purch_reqn_link_type.created_by
    fill_in "Desc", with: @purch_reqn_link_type.desc
    fill_in "Ident name", with: @purch_reqn_link_type.ident_name
    fill_in "Name", with: @purch_reqn_link_type.name
    check "System" if @purch_reqn_link_type.system
    fill_in "Updated by", with: @purch_reqn_link_type.updated_by
    click_on "Create Purch reqn link type"

    assert_text "Purch reqn link type was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn link type" do
    visit purch_reqn_link_type_url(@purch_reqn_link_type)
    click_on "Edit this purch reqn link type", match: :first

    fill_in "App", with: @purch_reqn_link_type.app_id
    fill_in "Created by", with: @purch_reqn_link_type.created_by
    fill_in "Desc", with: @purch_reqn_link_type.desc
    fill_in "Ident name", with: @purch_reqn_link_type.ident_name
    fill_in "Name", with: @purch_reqn_link_type.name
    check "System" if @purch_reqn_link_type.system
    fill_in "Updated by", with: @purch_reqn_link_type.updated_by
    click_on "Update Purch reqn link type"

    assert_text "Purch reqn link type was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn link type" do
    visit purch_reqn_link_type_url(@purch_reqn_link_type)
    click_on "Destroy this purch reqn link type", match: :first

    assert_text "Purch reqn link type was successfully destroyed"
  end
end
