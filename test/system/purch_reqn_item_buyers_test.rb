require "application_system_test_case"

class PurchReqnItemBuyersTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_item_buyer = purch_reqn_item_buyers(:one)
  end

  test "visiting the index" do
    visit purch_reqn_item_buyers_url
    assert_selector "h1", text: "Purch reqn item buyers"
  end

  test "should create purch reqn item buyer" do
    visit purch_reqn_item_buyers_url
    click_on "New purch reqn item buyer"

    fill_in "App", with: @purch_reqn_item_buyer.app_id
    fill_in "Buyer", with: @purch_reqn_item_buyer.buyer_id
    fill_in "Created by", with: @purch_reqn_item_buyer.created_by_id
    fill_in "Purch reqn item", with: @purch_reqn_item_buyer.purch_reqn_item_id
    fill_in "Updated by", with: @purch_reqn_item_buyer.updated_by_id
    click_on "Create Purch reqn item buyer"

    assert_text "Purch reqn item buyer was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn item buyer" do
    visit purch_reqn_item_buyer_url(@purch_reqn_item_buyer)
    click_on "Edit this purch reqn item buyer", match: :first

    fill_in "App", with: @purch_reqn_item_buyer.app_id
    fill_in "Buyer", with: @purch_reqn_item_buyer.buyer_id
    fill_in "Created by", with: @purch_reqn_item_buyer.created_by_id
    fill_in "Purch reqn item", with: @purch_reqn_item_buyer.purch_reqn_item_id
    fill_in "Updated by", with: @purch_reqn_item_buyer.updated_by_id
    click_on "Update Purch reqn item buyer"

    assert_text "Purch reqn item buyer was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn item buyer" do
    visit purch_reqn_item_buyer_url(@purch_reqn_item_buyer)
    click_on "Destroy this purch reqn item buyer", match: :first

    assert_text "Purch reqn item buyer was successfully destroyed"
  end
end
