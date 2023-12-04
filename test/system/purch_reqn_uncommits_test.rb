require "application_system_test_case"

class PurchReqnUncommitsTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_uncommit = purch_reqn_uncommits(:one)
  end

  test "visiting the index" do
    visit purch_reqn_uncommits_url
    assert_selector "h1", text: "Purch reqn uncommits"
  end

  test "should create purch reqn uncommit" do
    visit purch_reqn_uncommits_url
    click_on "New purch reqn uncommit"

    fill_in "App", with: @purch_reqn_uncommit.app_id
    fill_in "Created by", with: @purch_reqn_uncommit.created_by
    fill_in "Current workflow instance", with: @purch_reqn_uncommit.current_workflow_instance_id
    fill_in "Desc", with: @purch_reqn_uncommit.desc
    fill_in "Purch reqn", with: @purch_reqn_uncommit.purch_reqn_id
    fill_in "State", with: @purch_reqn_uncommit.state
    fill_in "Uncommit remark", with: @purch_reqn_uncommit.uncommit_remark
    fill_in "Updated by", with: @purch_reqn_uncommit.updated_by_id
    click_on "Create Purch reqn uncommit"

    assert_text "Purch reqn uncommit was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn uncommit" do
    visit purch_reqn_uncommit_url(@purch_reqn_uncommit)
    click_on "Edit this purch reqn uncommit", match: :first

    fill_in "App", with: @purch_reqn_uncommit.app_id
    fill_in "Created by", with: @purch_reqn_uncommit.created_by
    fill_in "Current workflow instance", with: @purch_reqn_uncommit.current_workflow_instance_id
    fill_in "Desc", with: @purch_reqn_uncommit.desc
    fill_in "Purch reqn", with: @purch_reqn_uncommit.purch_reqn_id
    fill_in "State", with: @purch_reqn_uncommit.state
    fill_in "Uncommit remark", with: @purch_reqn_uncommit.uncommit_remark
    fill_in "Updated by", with: @purch_reqn_uncommit.updated_by_id
    click_on "Update Purch reqn uncommit"

    assert_text "Purch reqn uncommit was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn uncommit" do
    visit purch_reqn_uncommit_url(@purch_reqn_uncommit)
    click_on "Destroy this purch reqn uncommit", match: :first

    assert_text "Purch reqn uncommit was successfully destroyed"
  end
end
