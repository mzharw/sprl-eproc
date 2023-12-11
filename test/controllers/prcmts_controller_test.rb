require "test_helper"

class PrcmtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prcmt = prcmts(:one)
  end

  test "should get index" do
    get prcmts_url
    assert_response :success
  end

  test "should get new" do
    get new_prcmt_url
    assert_response :success
  end

  test "should create prcmt" do
    assert_difference("Prcmt.count") do
      post prcmts_url, params: { prcmt: { aanwijzing_visibility: @prcmt.aanwijzing_visibility, announced_at: @prcmt.announced_at, assessment_method: @prcmt.assessment_method, auction: @prcmt.auction, bid_bond: @prcmt.bid_bond, bid_bond_visibility: @prcmt.bid_bond_visibility, bid_submission_method: @prcmt.bid_submission_method, business_class: @prcmt.business_class, business_field: @prcmt.business_field, buyer_id: @prcmt.buyer_id, cancel_remark: @prcmt.cancel_remark, cancelled_at: @prcmt.cancelled_at, candidate_selection_remark: @prcmt.candidate_selection_remark, contract_number: @prcmt.contract_number, created_at: @prcmt.created_at, created_by_id: @prcmt.created_by_id, current_workflow_instance_id: @prcmt.current_workflow_instance_id, data: @prcmt.data, desc: @prcmt.desc, est_total: @prcmt.est_total, eval_method: @prcmt.eval_method, finish_remark: @prcmt.finish_remark, finished_at: @prcmt.finished_at, incoterm_id: @prcmt.incoterm_id, internal_org_id: @prcmt.internal_org_id, internal_remark: @prcmt.internal_remark, name: @prcmt.name, number: @prcmt.number, plant_id: @prcmt.plant_id, prcmt_criterion_template_id: @prcmt.prcmt_criterion_template_id, prcmt_phase_evaluation_visibility: @prcmt.prcmt_phase_evaluation_visibility, prcmt_type_id: @prcmt.prcmt_type_id, prebid_meeting: @prcmt.prebid_meeting, prequalification: @prcmt.prequalification, proposed_delivery_location: @prcmt.proposed_delivery_location, purch_group_id: @prcmt.purch_group_id, purch_order_number: @prcmt.purch_order_number, purch_org_id: @prcmt.purch_org_id, quotation_media: @prcmt.quotation_media, quotation_validity_days: @prcmt.quotation_validity_days, scope_of_supplies: @prcmt.scope_of_supplies, scope_of_work: @prcmt.scope_of_work, state: @prcmt.state, tender_location: @prcmt.tender_location, tkdn_percentage: @prcmt.tkdn_percentage, updated_at: @prcmt.updated_at, updated_by_id: @prcmt.updated_by_id } }
    end

    assert_redirected_to prcmt_url(Prcmt.last)
  end

  test "should show prcmt" do
    get prcmt_url(@prcmt)
    assert_response :success
  end

  test "should get edit" do
    get edit_prcmt_url(@prcmt)
    assert_response :success
  end

  test "should update prcmt" do
    patch prcmt_url(@prcmt), params: { prcmt: { aanwijzing_visibility: @prcmt.aanwijzing_visibility, announced_at: @prcmt.announced_at, assessment_method: @prcmt.assessment_method, auction: @prcmt.auction, bid_bond: @prcmt.bid_bond, bid_bond_visibility: @prcmt.bid_bond_visibility, bid_submission_method: @prcmt.bid_submission_method, business_class: @prcmt.business_class, business_field: @prcmt.business_field, buyer_id: @prcmt.buyer_id, cancel_remark: @prcmt.cancel_remark, cancelled_at: @prcmt.cancelled_at, candidate_selection_remark: @prcmt.candidate_selection_remark, contract_number: @prcmt.contract_number, created_at: @prcmt.created_at, created_by_id: @prcmt.created_by_id, current_workflow_instance_id: @prcmt.current_workflow_instance_id, data: @prcmt.data, desc: @prcmt.desc, est_total: @prcmt.est_total, eval_method: @prcmt.eval_method, finish_remark: @prcmt.finish_remark, finished_at: @prcmt.finished_at, incoterm_id: @prcmt.incoterm_id, internal_org_id: @prcmt.internal_org_id, internal_remark: @prcmt.internal_remark, name: @prcmt.name, number: @prcmt.number, plant_id: @prcmt.plant_id, prcmt_criterion_template_id: @prcmt.prcmt_criterion_template_id, prcmt_phase_evaluation_visibility: @prcmt.prcmt_phase_evaluation_visibility, prcmt_type_id: @prcmt.prcmt_type_id, prebid_meeting: @prcmt.prebid_meeting, prequalification: @prcmt.prequalification, proposed_delivery_location: @prcmt.proposed_delivery_location, purch_group_id: @prcmt.purch_group_id, purch_order_number: @prcmt.purch_order_number, purch_org_id: @prcmt.purch_org_id, quotation_media: @prcmt.quotation_media, quotation_validity_days: @prcmt.quotation_validity_days, scope_of_supplies: @prcmt.scope_of_supplies, scope_of_work: @prcmt.scope_of_work, state: @prcmt.state, tender_location: @prcmt.tender_location, tkdn_percentage: @prcmt.tkdn_percentage, updated_at: @prcmt.updated_at, updated_by_id: @prcmt.updated_by_id } }
    assert_redirected_to prcmt_url(@prcmt)
  end

  test "should destroy prcmt" do
    assert_difference("Prcmt.count", -1) do
      delete prcmt_url(@prcmt)
    end

    assert_redirected_to prcmts_url
  end
end
