require "application_system_test_case"

class BuyersTest < ApplicationSystemTestCase
  setup do
    @buyer = buyers(:one)
  end

  test "visiting the index" do
    visit buyers_url
    assert_selector "h1", text: "Buyers"
  end

  test "should create buyer" do
    visit buyers_url
    click_on "New buyer"

    fill_in "App", with: @buyer.app_id
    fill_in "Code", with: @buyer.code
    fill_in "Created at", with: @buyer.created_at
    fill_in "From date", with: @buyer.from_date
    fill_in "Party", with: @buyer.party_id
    fill_in "Thru date", with: @buyer.thru_date
    fill_in "Updated at", with: @buyer.updated_at
    click_on "Create Buyer"

    assert_text "Buyer was successfully created"
    click_on "Back"
  end

  test "should update Buyer" do
    visit buyer_url(@buyer)
    click_on "Edit this buyer", match: :first

    fill_in "App", with: @buyer.app_id
    fill_in "Code", with: @buyer.code
    fill_in "Created at", with: @buyer.created_at
    fill_in "From date", with: @buyer.from_date
    fill_in "Party", with: @buyer.party_id
    fill_in "Thru date", with: @buyer.thru_date
    fill_in "Updated at", with: @buyer.updated_at
    click_on "Update Buyer"

    assert_text "Buyer was successfully updated"
    click_on "Back"
  end

  test "should destroy Buyer" do
    visit buyer_url(@buyer)
    click_on "Destroy this buyer", match: :first

    assert_text "Buyer was successfully destroyed"
  end
end
