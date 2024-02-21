require "application_system_test_case"

class PrcmtTypesTest < ApplicationSystemTestCase
  setup do
    @prcmt_type = prcmt_types(:one)
  end

  test "visiting the index" do
    visit prcmt_types_url
    assert_selector "h1", text: "Prcmt types"
  end

  test "should create prcmt type" do
    visit prcmt_types_url
    click_on "New prcmt type"

    fill_in "Desc", with: @prcmt_type.desc
    fill_in "Ident name", with: @prcmt_type.ident_name
    fill_in "Name", with: @prcmt_type.name
    check "System" if @prcmt_type.system
    fill_in "Visibility", with: @prcmt_type.visibility
    click_on "Create Prcmt type"

    assert_text "Prcmt type was successfully created"
    click_on "Back"
  end

  test "should update Prcmt type" do
    visit prcmt_type_url(@prcmt_type)
    click_on "Edit this prcmt type", match: :first

    fill_in "Desc", with: @prcmt_type.desc
    fill_in "Ident name", with: @prcmt_type.ident_name
    fill_in "Name", with: @prcmt_type.name
    check "System" if @prcmt_type.system
    fill_in "Visibility", with: @prcmt_type.visibility
    click_on "Update Prcmt type"

    assert_text "Prcmt type was successfully updated"
    click_on "Back"
  end

  test "should destroy Prcmt type" do
    visit prcmt_type_url(@prcmt_type)
    click_on "Destroy this prcmt type", match: :first

    assert_text "Prcmt type was successfully destroyed"
  end
end
