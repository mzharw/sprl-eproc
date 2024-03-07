require "application_system_test_case"

class BuyerPurchGroupsTest < ApplicationSystemTestCase
  setup do
    @buyer_purch_group = buyer_purch_groups(:one)
  end

  test "visiting the index" do
    visit buyer_purch_groups_url
    assert_selector "h1", text: "Buyer purch groups"
  end

  test "should create buyer purch group" do
    visit buyer_purch_groups_url
    click_on "New buyer purch group"

    fill_in "Buyer", with: @buyer_purch_group.buyer
    fill_in "Created at", with: @buyer_purch_group.created_at
    fill_in "Created by", with: @buyer_purch_group.created_by_id
    fill_in "From date", with: @buyer_purch_group.from_date
    fill_in "Purch group", with: @buyer_purch_group.purch_group
    fill_in "Thru date", with: @buyer_purch_group.thru_date
    fill_in "Updated at", with: @buyer_purch_group.updated_at
    fill_in "Updated by", with: @buyer_purch_group.updated_by_id
    click_on "Create Buyer purch group"

    assert_text "Buyer purch group was successfully created"
    click_on "Back"
  end

  test "should update Buyer purch group" do
    visit buyer_purch_group_url(@buyer_purch_group)
    click_on "Edit this buyer purch group", match: :first

    fill_in "Buyer", with: @buyer_purch_group.buyer
    fill_in "Created at", with: @buyer_purch_group.created_at
    fill_in "Created by", with: @buyer_purch_group.created_by_id
    fill_in "From date", with: @buyer_purch_group.from_date
    fill_in "Purch group", with: @buyer_purch_group.purch_group
    fill_in "Thru date", with: @buyer_purch_group.thru_date
    fill_in "Updated at", with: @buyer_purch_group.updated_at
    fill_in "Updated by", with: @buyer_purch_group.updated_by_id
    click_on "Update Buyer purch group"

    assert_text "Buyer purch group was successfully updated"
    click_on "Back"
  end

  test "should destroy Buyer purch group" do
    visit buyer_purch_group_url(@buyer_purch_group)
    click_on "Destroy this buyer purch group", match: :first

    assert_text "Buyer purch group was successfully destroyed"
  end
end
