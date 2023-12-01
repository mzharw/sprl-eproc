require "application_system_test_case"

class MeasurementUnitsTest < ApplicationSystemTestCase
  setup do
    @measurement_unit = measurement_units(:one)
  end

  test "visiting the index" do
    visit measurement_units_url
    assert_selector "h1", text: "Measurement units"
  end

  test "should create measurement unit" do
    visit measurement_units_url
    click_on "New measurement unit"

    fill_in "App", with: @measurement_unit.app_id
    fill_in "Created at", with: @measurement_unit.created_at
    fill_in "Created by", with: @measurement_unit.created_by_id
    fill_in "Desc", with: @measurement_unit.desc
    fill_in "Dimid", with: @measurement_unit.dimid
    fill_in "Ident name", with: @measurement_unit.ident_name
    fill_in "Name", with: @measurement_unit.name
    fill_in "Symbol", with: @measurement_unit.symbol
    fill_in "Updated at", with: @measurement_unit.updated_at
    fill_in "Updated by", with: @measurement_unit.updated_by_id
    click_on "Create Measurement unit"

    assert_text "Measurement unit was successfully created"
    click_on "Back"
  end

  test "should update Measurement unit" do
    visit measurement_unit_url(@measurement_unit)
    click_on "Edit this measurement unit", match: :first

    fill_in "App", with: @measurement_unit.app_id
    fill_in "Created at", with: @measurement_unit.created_at
    fill_in "Created by", with: @measurement_unit.created_by_id
    fill_in "Desc", with: @measurement_unit.desc
    fill_in "Dimid", with: @measurement_unit.dimid
    fill_in "Ident name", with: @measurement_unit.ident_name
    fill_in "Name", with: @measurement_unit.name
    fill_in "Symbol", with: @measurement_unit.symbol
    fill_in "Updated at", with: @measurement_unit.updated_at
    fill_in "Updated by", with: @measurement_unit.updated_by_id
    click_on "Update Measurement unit"

    assert_text "Measurement unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Measurement unit" do
    visit measurement_unit_url(@measurement_unit)
    click_on "Destroy this measurement unit", match: :first

    assert_text "Measurement unit was successfully destroyed"
  end
end
