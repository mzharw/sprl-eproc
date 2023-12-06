require "application_system_test_case"

class PurchReqnCancellationsTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_cancellation = purch_reqn_cancellations(:one)
  end

  test "visiting the index" do
    visit purch_reqn_cancellations_url
    assert_selector "h1", text: "Purch reqn cancellations"
  end

  test "should create purch reqn cancellation" do
    visit purch_reqn_cancellations_url
    click_on "New purch reqn cancellation"

    fill_in "App", with: @purch_reqn_cancellation.app_id
    fill_in "Created by", with: @purch_reqn_cancellation.created_by
    fill_in "Current workflow instance", with: @purch_reqn_cancellation.current_workflow_instance_id
    fill_in "Purch reqn", with: @purch_reqn_cancellation.purch_reqn_id
    fill_in "State", with: @purch_reqn_cancellation.state
    fill_in "Updated by", with: @purch_reqn_cancellation.updated_by
    click_on "Create Purch reqn cancellation"

    assert_text "Purch reqn cancellation was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn cancellation" do
    visit purch_reqn_cancellation_url(@purch_reqn_cancellation)
    click_on "Edit this purch reqn cancellation", match: :first

    fill_in "App", with: @purch_reqn_cancellation.app_id
    fill_in "Created by", with: @purch_reqn_cancellation.created_by
    fill_in "Current workflow instance", with: @purch_reqn_cancellation.current_workflow_instance_id
    fill_in "Purch reqn", with: @purch_reqn_cancellation.purch_reqn_id
    fill_in "State", with: @purch_reqn_cancellation.state
    fill_in "Updated by", with: @purch_reqn_cancellation.updated_by
    click_on "Update Purch reqn cancellation"

    assert_text "Purch reqn cancellation was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn cancellation" do
    visit purch_reqn_cancellation_url(@purch_reqn_cancellation)
    click_on "Destroy this purch reqn cancellation", match: :first

    assert_text "Purch reqn cancellation was successfully destroyed"
  end
end
