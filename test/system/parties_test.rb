require "application_system_test_case"

class PartiesTest < ApplicationSystemTestCase
  setup do
    @party = parties(:one)
  end

  test "visiting the index" do
    visit parties_url
    assert_selector "h1", text: "Parties"
  end

  test "should create party" do
    visit parties_url
    click_on "New party"

    fill_in "Created at", with: @party.created_at
    fill_in "Created by", with: @party.created_by_id
    fill_in "Data", with: @party.data
    fill_in "Full name", with: @party&.full_name
    fill_in "Party type", with: @party.party_type
    fill_in "Updated at", with: @party.updated_at
    fill_in "Updated by", with: @party.updated_by_id
    click_on "Create Party"

    assert_text "Party was successfully created"
    click_on "Back"
  end

  test "should update Party" do
    visit party_url(@party)
    click_on "Edit this party", match: :first

    fill_in "Created at", with: @party.created_at
    fill_in "Created by", with: @party.created_by_id
    fill_in "Data", with: @party.data
    fill_in "Full name", with: @party&.full_name
    fill_in "Party type", with: @party.party_type
    fill_in "Updated at", with: @party.updated_at
    fill_in "Updated by", with: @party.updated_by_id
    click_on "Update Party"

    assert_text "Party was successfully updated"
    click_on "Back"
  end

  test "should destroy Party" do
    visit party_url(@party)
    click_on "Destroy this party", match: :first

    assert_text "Party was successfully destroyed"
  end
end
