require "application_system_test_case"

class PrcmtsTest < ApplicationSystemTestCase
  setup do
    @prcmt = prcmts(:one)
  end

  test "visiting the index" do
    visit prcmts_url
    assert_selector "h1", text: "Prcmts"
  end

  test "should create prcmt" do
    visit prcmts_url
    click_on "New prcmt"

    fill_in "Aanwijzing visibility", with: @prcmt.aanwijzing_visibility
    fill_in "Announced at", with: @prcmt.announced_at
    fill_in "App", with: @prcmt.app_id
    fill_in "Assessment method", with: @prcmt.assessment_method
    check "Auction" if @prcmt.auction
    check "Bid bond" if @prcmt.bid_bond
    fill_in "Bid bond visibility", with: @prcmt.bid_bond_visibility
    fill_in "Bid submission method", with: @prcmt.bid_submission_method
    fill_in "Business class", with: @prcmt.business_class
    fill_in "Business field", with: @prcmt.business_field
    fill_in "Buyer", with: @prcmt.buyer_id
    fill_in "Cancel remark", with: @prcmt.cancel_remark
    fill_in "Cancelled at", with: @prcmt.cancelled_at
    fill_in "Candidate selection remark", with: @prcmt.candidate_selection_remark
    fill_in "Contract number", with: @prcmt.contract_number
    fill_in "Created at", with: @prcmt.created_at
    fill_in "Created by", with: @prcmt.created_by
    fill_in "Current workflow instance", with: @prcmt.current_workflow_instance_id
    fill_in "Data", with: @prcmt.data
    fill_in "Desc", with: @prcmt.desc
    fill_in "Est total", with: @prcmt.est_total
    fill_in "Eval method", with: @prcmt.eval_method
    fill_in "Finish remark", with: @prcmt.finish_remark
    fill_in "Finished at", with: @prcmt.finished_at
    fill_in "Incoterm", with: @prcmt.incoterm_id
    fill_in "Internal org", with: @prcmt.internal_org_id
    fill_in "Internal remark", with: @prcmt.internal_remark
    fill_in "Name", with: @prcmt.name
    fill_in "Number", with: @prcmt.number
    fill_in "Plant", with: @prcmt.plant_id
    fill_in "Prcmt criterion template", with: @prcmt.prcmt_criterion_template_id
    fill_in "Prcmt phase evaluation visibility", with: @prcmt.prcmt_phase_evaluation_visibility
    fill_in "Prcmt type", with: @prcmt.prcmt_type_id
    fill_in "Prebid meeting", with: @prcmt.prebid_meeting
    check "Prequalification" if @prcmt.prequalification
    fill_in "Proposed delivery location", with: @prcmt.proposed_delivery_location
    fill_in "Purch group", with: @prcmt.purch_group_id
    fill_in "Purch order number", with: @prcmt.purch_order_number
    fill_in "Purch org", with: @prcmt.purch_org_id
    fill_in "Quotation media", with: @prcmt.quotation_media
    fill_in "Quotation validity days", with: @prcmt.quotation_validity_days
    fill_in "Scope of supplies", with: @prcmt.scope_of_supplies
    fill_in "Scope of work", with: @prcmt.scope_of_work
    fill_in "State", with: @prcmt.state
    fill_in "Tender location", with: @prcmt.tender_location
    fill_in "Tkdn percentage", with: @prcmt.tkdn_percentage
    fill_in "Updated at", with: @prcmt.updated_at
    fill_in "Updated by", with: @prcmt.updated_by_id
    click_on "Create Prcmt"

    assert_text "Prcmt was successfully created"
    click_on "Back"
  end

  test "should update Prcmt" do
    visit prcmt_url(@prcmt)
    click_on "Edit this prcmt", match: :first

    fill_in "Aanwijzing visibility", with: @prcmt.aanwijzing_visibility
    fill_in "Announced at", with: @prcmt.announced_at
    fill_in "App", with: @prcmt.app_id
    fill_in "Assessment method", with: @prcmt.assessment_method
    check "Auction" if @prcmt.auction
    check "Bid bond" if @prcmt.bid_bond
    fill_in "Bid bond visibility", with: @prcmt.bid_bond_visibility
    fill_in "Bid submission method", with: @prcmt.bid_submission_method
    fill_in "Business class", with: @prcmt.business_class
    fill_in "Business field", with: @prcmt.business_field
    fill_in "Buyer", with: @prcmt.buyer_id
    fill_in "Cancel remark", with: @prcmt.cancel_remark
    fill_in "Cancelled at", with: @prcmt.cancelled_at
    fill_in "Candidate selection remark", with: @prcmt.candidate_selection_remark
    fill_in "Contract number", with: @prcmt.contract_number
    fill_in "Created at", with: @prcmt.created_at
    fill_in "Created by", with: @prcmt.created_by
    fill_in "Current workflow instance", with: @prcmt.current_workflow_instance_id
    fill_in "Data", with: @prcmt.data
    fill_in "Desc", with: @prcmt.desc
    fill_in "Est total", with: @prcmt.est_total
    fill_in "Eval method", with: @prcmt.eval_method
    fill_in "Finish remark", with: @prcmt.finish_remark
    fill_in "Finished at", with: @prcmt.finished_at
    fill_in "Incoterm", with: @prcmt.incoterm_id
    fill_in "Internal org", with: @prcmt.internal_org_id
    fill_in "Internal remark", with: @prcmt.internal_remark
    fill_in "Name", with: @prcmt.name
    fill_in "Number", with: @prcmt.number
    fill_in "Plant", with: @prcmt.plant_id
    fill_in "Prcmt criterion template", with: @prcmt.prcmt_criterion_template_id
    fill_in "Prcmt phase evaluation visibility", with: @prcmt.prcmt_phase_evaluation_visibility
    fill_in "Prcmt type", with: @prcmt.prcmt_type_id
    fill_in "Prebid meeting", with: @prcmt.prebid_meeting
    check "Prequalification" if @prcmt.prequalification
    fill_in "Proposed delivery location", with: @prcmt.proposed_delivery_location
    fill_in "Purch group", with: @prcmt.purch_group_id
    fill_in "Purch order number", with: @prcmt.purch_order_number
    fill_in "Purch org", with: @prcmt.purch_org_id
    fill_in "Quotation media", with: @prcmt.quotation_media
    fill_in "Quotation validity days", with: @prcmt.quotation_validity_days
    fill_in "Scope of supplies", with: @prcmt.scope_of_supplies
    fill_in "Scope of work", with: @prcmt.scope_of_work
    fill_in "State", with: @prcmt.state
    fill_in "Tender location", with: @prcmt.tender_location
    fill_in "Tkdn percentage", with: @prcmt.tkdn_percentage
    fill_in "Updated at", with: @prcmt.updated_at
    fill_in "Updated by", with: @prcmt.updated_by_id
    click_on "Update Prcmt"

    assert_text "Prcmt was successfully updated"
    click_on "Back"
  end

  test "should destroy Prcmt" do
    visit prcmt_url(@prcmt)
    click_on "Destroy this prcmt", match: :first

    assert_text "Prcmt was successfully destroyed"
  end
end
