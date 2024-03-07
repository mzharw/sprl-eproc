require "application_system_test_case"

class BuyerPlantsTest < ApplicationSystemTestCase
  setup do
    @buyer_plant = buyer_plants(:one)
  end

  test "visiting the index" do
    visit buyer_plants_url
    assert_selector "h1", text: "Buyer plants"
  end

  test "should create buyer plant" do
    visit buyer_plants_url
    click_on "New buyer plant"

    fill_in "Buyer", with: @buyer_plant.buyer
    fill_in "Created at", with: @buyer_plant.created_at
    fill_in "Created by", with: @buyer_plant.created_by_id
    fill_in "From date", with: @buyer_plant.from_date
    fill_in "Plant", with: @buyer_plant.plant
    fill_in "Thru date", with: @buyer_plant.thru_date
    fill_in "Updated at", with: @buyer_plant.updated_at
    fill_in "Updated by", with: @buyer_plant.updated_by_id
    click_on "Create Buyer plant"

    assert_text "Buyer plant was successfully created"
    click_on "Back"
  end

  test "should update Buyer plant" do
    visit buyer_plant_url(@buyer_plant)
    click_on "Edit this buyer plant", match: :first

    fill_in "Buyer", with: @buyer_plant.buyer
    fill_in "Created at", with: @buyer_plant.created_at
    fill_in "Created by", with: @buyer_plant.created_by_id
    fill_in "From date", with: @buyer_plant.from_date
    fill_in "Plant", with: @buyer_plant.plant
    fill_in "Thru date", with: @buyer_plant.thru_date
    fill_in "Updated at", with: @buyer_plant.updated_at
    fill_in "Updated by", with: @buyer_plant.updated_by_id
    click_on "Update Buyer plant"

    assert_text "Buyer plant was successfully updated"
    click_on "Back"
  end

  test "should destroy Buyer plant" do
    visit buyer_plant_url(@buyer_plant)
    click_on "Destroy this buyer plant", match: :first

    assert_text "Buyer plant was successfully destroyed"
  end
end
