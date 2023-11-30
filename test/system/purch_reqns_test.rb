require "application_system_test_case"

class PurchReqnsTest < ApplicationSystemTestCase
  setup do
    @purch_reqn = purch_reqns(:one)
  end

  test "visiting the index" do
    visit purch_reqns_url
    assert_selector "h1", text: "Purch reqns"
  end

  test "should create purch reqn" do
    visit purch_reqns_url
    click_on "New purch reqn"

    fill_in "App", with: @purch_reqn.app_id
    fill_in "Budget soure", with: @purch_reqn.budget_soure
    fill_in "Cancel remark", with: @purch_reqn.cancel_remark
    check "Contract" if @purch_reqn.contract
    fill_in "Contract reference", with: @purch_reqn.contract_reference_id
    fill_in "Contract title", with: @purch_reqn.contract_title
    fill_in "Contract type", with: @purch_reqn.contract_type
    fill_in "Cost center", with: @purch_reqn.cost_center_id
    fill_in "Created by", with: @purch_reqn.created_by_id
    fill_in "Currency", with: @purch_reqn.currency_id
    fill_in "Current workflow instance", with: @purch_reqn.current_workflow_instance_id
    fill_in "Desc", with: @purch_reqn.desc
    fill_in "Explanation", with: @purch_reqn.explanation
    fill_in "Fund source", with: @purch_reqn.fund_source
    fill_in "Justification", with: @purch_reqn.justification
    fill_in "Local of content", with: @purch_reqn.local_of_content
    fill_in "Number", with: @purch_reqn.number
    fill_in "Plant", with: @purch_reqn.plant_id
    fill_in "Prcmt", with: @purch_reqn.prcmt_id
    fill_in "Previous contract number", with: @purch_reqn.previous_contract_number
    fill_in "Previous contract title", with: @purch_reqn.previous_contract_title
    fill_in "Purch group", with: @purch_reqn.purch_group_id
    fill_in "Purch org", with: @purch_reqn.purch_org_id
    fill_in "Purch reqn type", with: @purch_reqn.purch_reqn_type
    fill_in "Reason", with: @purch_reqn.reason
    fill_in "Recreate from", with: @purch_reqn.recreate_from_id
    fill_in "Rejected at", with: @purch_reqn.rejected_at
    fill_in "Risk category", with: @purch_reqn.risk_category
    fill_in "Scope of work", with: @purch_reqn.scope_of_work
    fill_in "State", with: @purch_reqn.state
    fill_in "Updated by", with: @purch_reqn.updated_by_id
    click_on "Create Purch reqn"

    assert_text "Purch reqn was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn" do
    visit purch_reqn_url(@purch_reqn)
    click_on "Edit this purch reqn", match: :first

    fill_in "App", with: @purch_reqn.app_id
    fill_in "Budget soure", with: @purch_reqn.budget_soure
    fill_in "Cancel remark", with: @purch_reqn.cancel_remark
    check "Contract" if @purch_reqn.contract
    fill_in "Contract reference", with: @purch_reqn.contract_reference_id
    fill_in "Contract title", with: @purch_reqn.contract_title
    fill_in "Contract type", with: @purch_reqn.contract_type
    fill_in "Cost center", with: @purch_reqn.cost_center_id
    fill_in "Created by", with: @purch_reqn.created_by_id
    fill_in "Currency", with: @purch_reqn.currency_id
    fill_in "Current workflow instance", with: @purch_reqn.current_workflow_instance_id
    fill_in "Desc", with: @purch_reqn.desc
    fill_in "Explanation", with: @purch_reqn.explanation
    fill_in "Fund source", with: @purch_reqn.fund_source
    fill_in "Justification", with: @purch_reqn.justification
    fill_in "Local of content", with: @purch_reqn.local_of_content
    fill_in "Number", with: @purch_reqn.number
    fill_in "Plant", with: @purch_reqn.plant_id
    fill_in "Prcmt", with: @purch_reqn.prcmt_id
    fill_in "Previous contract number", with: @purch_reqn.previous_contract_number
    fill_in "Previous contract title", with: @purch_reqn.previous_contract_title
    fill_in "Purch group", with: @purch_reqn.purch_group_id
    fill_in "Purch org", with: @purch_reqn.purch_org_id
    fill_in "Purch reqn type", with: @purch_reqn.purch_reqn_type
    fill_in "Reason", with: @purch_reqn.reason
    fill_in "Recreate from", with: @purch_reqn.recreate_from_id
    fill_in "Rejected at", with: @purch_reqn.rejected_at
    fill_in "Risk category", with: @purch_reqn.risk_category
    fill_in "Scope of work", with: @purch_reqn.scope_of_work
    fill_in "State", with: @purch_reqn.state
    fill_in "Updated by", with: @purch_reqn.updated_by_id
    click_on "Update Purch reqn"

    assert_text "Purch reqn was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn" do
    visit purch_reqn_url(@purch_reqn)
    click_on "Destroy this purch reqn", match: :first

    assert_text "Purch reqn was successfully destroyed"
  end
end
