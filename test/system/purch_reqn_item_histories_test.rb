require "application_system_test_case"

class PurchReqnItemHistoriesTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_item_history = purch_reqn_item_histories(:one)
  end

  test "visiting the index" do
    visit purch_reqn_item_histories_url
    assert_selector "h1", text: "Purch reqn item histories"
  end

  test "should create purch reqn item history" do
    visit purch_reqn_item_histories_url
    click_on "New purch reqn item history"

    fill_in "App", with: @purch_reqn_item_history.app_id
    fill_in "Created by", with: @purch_reqn_item_history.created_by
    fill_in "Desc", with: @purch_reqn_item_history.desc
    fill_in "Finished at", with: @purch_reqn_item_history.finished_at
    fill_in "Purch reqn item", with: @purch_reqn_item_history.purch_reqn_item_id
    fill_in "Schedule", with: @purch_reqn_item_history.schedule_id
    check "System" if @purch_reqn_item_history.system
    fill_in "Updated by", with: @purch_reqn_item_history.updated_by
    fill_in "Username", with: @purch_reqn_item_history.username
    click_on "Create Purch reqn item history"

    assert_text "Purch reqn item history was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn item history" do
    visit purch_reqn_item_history_url(@purch_reqn_item_history)
    click_on "Edit this purch reqn item history", match: :first

    fill_in "App", with: @purch_reqn_item_history.app_id
    fill_in "Created by", with: @purch_reqn_item_history.created_by
    fill_in "Desc", with: @purch_reqn_item_history.desc
    fill_in "Finished at", with: @purch_reqn_item_history.finished_at
    fill_in "Purch reqn item", with: @purch_reqn_item_history.purch_reqn_item_id
    fill_in "Schedule", with: @purch_reqn_item_history.schedule_id
    check "System" if @purch_reqn_item_history.system
    fill_in "Updated by", with: @purch_reqn_item_history.updated_by
    fill_in "Username", with: @purch_reqn_item_history.username
    click_on "Update Purch reqn item history"

    assert_text "Purch reqn item history was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn item history" do
    visit purch_reqn_item_history_url(@purch_reqn_item_history)
    click_on "Destroy this purch reqn item history", match: :first

    assert_text "Purch reqn item history was successfully destroyed"
  end
end
