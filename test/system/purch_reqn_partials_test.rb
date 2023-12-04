require "application_system_test_case"

class PurchReqnPartialsTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_partial = purch_reqn_partials(:one)
  end

  test "visiting the index" do
    visit purch_reqn_partials_url
    assert_selector "h1", text: "Purch reqn partials"
  end

  test "should create purch reqn partial" do
    visit purch_reqn_partials_url
    click_on "New purch reqn partial"

    fill_in "App", with: @purch_reqn_partial.app_id
    fill_in "Created by", with: @purch_reqn_partial.created_by
    fill_in "Data", with: @purch_reqn_partial.data
    fill_in "Partial itemable", with: @purch_reqn_partial.partial_itemable_id
    fill_in "Partial itemable type", with: @purch_reqn_partial.partial_itemable_type
    fill_in "Partialable", with: @purch_reqn_partial.partialable_id
    fill_in "Partialable type", with: @purch_reqn_partial.partialable_type
    fill_in "Purch reqn item", with: @purch_reqn_partial.purch_reqn_item_id
    fill_in "Qty", with: @purch_reqn_partial.qty
    fill_in "State", with: @purch_reqn_partial.state
    fill_in "Updated by", with: @purch_reqn_partial.updated_by_id
    click_on "Create Purch reqn partial"

    assert_text "Purch reqn partial was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn partial" do
    visit purch_reqn_partial_url(@purch_reqn_partial)
    click_on "Edit this purch reqn partial", match: :first

    fill_in "App", with: @purch_reqn_partial.app_id
    fill_in "Created by", with: @purch_reqn_partial.created_by
    fill_in "Data", with: @purch_reqn_partial.data
    fill_in "Partial itemable", with: @purch_reqn_partial.partial_itemable_id
    fill_in "Partial itemable type", with: @purch_reqn_partial.partial_itemable_type
    fill_in "Partialable", with: @purch_reqn_partial.partialable_id
    fill_in "Partialable type", with: @purch_reqn_partial.partialable_type
    fill_in "Purch reqn item", with: @purch_reqn_partial.purch_reqn_item_id
    fill_in "Qty", with: @purch_reqn_partial.qty
    fill_in "State", with: @purch_reqn_partial.state
    fill_in "Updated by", with: @purch_reqn_partial.updated_by_id
    click_on "Update Purch reqn partial"

    assert_text "Purch reqn partial was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn partial" do
    visit purch_reqn_partial_url(@purch_reqn_partial)
    click_on "Destroy this purch reqn partial", match: :first

    assert_text "Purch reqn partial was successfully destroyed"
  end
end
