require "application_system_test_case"

class PlantsTest < ApplicationSystemTestCase
  setup do
    @plant = plants(:one)
  end

  test "visiting the index" do
    visit plants_url
    assert_selector "h1", text: "Plants"
  end

  test "should create plant" do
    visit plants_url
    click_on "New plant"

    fill_in "Code", with: @plant.code
    fill_in "Facility", with: @plant.facility_id
    fill_in "From date", with: @plant.from_date
    fill_in "Owner party", with: @plant.owner_party_id
    fill_in "Thru date", with: @plant.thru_date
    click_on "Create Plant"

    assert_text "Plant was successfully created"
    click_on "Back"
  end

  test "should update Plant" do
    visit plant_url(@plant)
    click_on "Edit this plant", match: :first

    fill_in "Code", with: @plant.code
    fill_in "Facility", with: @plant.facility_id
    fill_in "From date", with: @plant.from_date
    fill_in "Owner party", with: @plant.owner_party_id
    fill_in "Thru date", with: @plant.thru_date
    click_on "Update Plant"

    assert_text "Plant was successfully updated"
    click_on "Back"
  end

  test "should destroy Plant" do
    visit plant_url(@plant)
    click_on "Destroy this plant", match: :first

    assert_text "Plant was successfully destroyed"
  end
end
