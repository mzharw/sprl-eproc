require "application_system_test_case"

class PurchReqnPartialStatusesTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_partial_status = purch_reqn_partial_statuses(:one)
  end

  test "visiting the index" do
    visit purch_reqn_partial_statuses_url
    assert_selector "h1", text: "Purch reqn partial statuses"
  end

  test "should create purch reqn partial status" do
    visit purch_reqn_partial_statuses_url
    click_on "New purch reqn partial status"

    fill_in "App", with: @purch_reqn_partial_status.app_id
    fill_in "Created by", with: @purch_reqn_partial_status.created_by
    fill_in "Partial itemable", with: @purch_reqn_partial_status.partial_itemable_id
    fill_in "Partial itemable type", with: @purch_reqn_partial_status.partial_itemable_type
    fill_in "Partialable", with: @purch_reqn_partial_status.partialable_id
    fill_in "Partialable type", with: @purch_reqn_partial_status.partialable_type
    fill_in "Purch reqn partial", with: @purch_reqn_partial_status.purch_reqn_partial_id
    fill_in "Status", with: @purch_reqn_partial_status.status
    fill_in "Updated by", with: @purch_reqn_partial_status.updated_by
    click_on "Create Purch reqn partial status"

    assert_text "Purch reqn partial status was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn partial status" do
    visit purch_reqn_partial_status_url(@purch_reqn_partial_status)
    click_on "Edit this purch reqn partial status", match: :first

    fill_in "App", with: @purch_reqn_partial_status.app_id
    fill_in "Created by", with: @purch_reqn_partial_status.created_by
    fill_in "Partial itemable", with: @purch_reqn_partial_status.partial_itemable_id
    fill_in "Partial itemable type", with: @purch_reqn_partial_status.partial_itemable_type
    fill_in "Partialable", with: @purch_reqn_partial_status.partialable_id
    fill_in "Partialable type", with: @purch_reqn_partial_status.partialable_type
    fill_in "Purch reqn partial", with: @purch_reqn_partial_status.purch_reqn_partial_id
    fill_in "Status", with: @purch_reqn_partial_status.status
    fill_in "Updated by", with: @purch_reqn_partial_status.updated_by
    click_on "Update Purch reqn partial status"

    assert_text "Purch reqn partial status was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn partial status" do
    visit purch_reqn_partial_status_url(@purch_reqn_partial_status)
    click_on "Destroy this purch reqn partial status", match: :first

    assert_text "Purch reqn partial status was successfully destroyed"
  end
end
