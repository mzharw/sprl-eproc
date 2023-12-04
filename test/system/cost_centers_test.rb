require "application_system_test_case"

class CostCentersTest < ApplicationSystemTestCase
  setup do
    @cost_center = cost_centers(:one)
  end

  test "visiting the index" do
    visit cost_centers_url
    assert_selector "h1", text: "Cost centers"
  end

  test "should create cost center" do
    visit cost_centers_url
    click_on "New cost center"

    fill_in "Cost center", with: @cost_center.cost_center_id
    fill_in "Created by", with: @cost_center.created_by
    fill_in "Ctrl name", with: @cost_center.ctrl_name
    fill_in "Desc", with: @cost_center.desc
    fill_in "Payroll", with: @cost_center.payroll_id
    fill_in "Position", with: @cost_center.position
    fill_in "Purch group", with: @cost_center.purch_group_id
    fill_in "Updated by", with: @cost_center.updated_by_id
    fill_in "Valid to", with: @cost_center.valid_to
    click_on "Create Cost center"

    assert_text "Cost center was successfully created"
    click_on "Back"
  end

  test "should update Cost center" do
    visit cost_center_url(@cost_center)
    click_on "Edit this cost center", match: :first

    fill_in "Cost center", with: @cost_center.cost_center_id
    fill_in "Created by", with: @cost_center.created_by
    fill_in "Ctrl name", with: @cost_center.ctrl_name
    fill_in "Desc", with: @cost_center.desc
    fill_in "Payroll", with: @cost_center.payroll_id
    fill_in "Position", with: @cost_center.position
    fill_in "Purch group", with: @cost_center.purch_group_id
    fill_in "Updated by", with: @cost_center.updated_by_id
    fill_in "Valid to", with: @cost_center.valid_to
    click_on "Update Cost center"

    assert_text "Cost center was successfully updated"
    click_on "Back"
  end

  test "should destroy Cost center" do
    visit cost_center_url(@cost_center)
    click_on "Destroy this cost center", match: :first

    assert_text "Cost center was successfully destroyed"
  end
end
