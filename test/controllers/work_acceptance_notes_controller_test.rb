require "test_helper"

class WorkAcceptanceNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_acceptance_note = work_acceptance_notes(:one)
  end

  test "should get index" do
    get work_acceptance_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_work_acceptance_note_url
    assert_response :success
  end

  test "should create work_acceptance_note" do
    assert_difference("WorkAcceptanceNote.count") do
      post work_acceptance_notes_url, params: { work_acceptance_note: { cancel_remark: @work_acceptance_note.cancel_remark, current_workflow_instance_id: @work_acceptance_note.current_workflow_instance_id, data: @work_acceptance_note.data, delivery_date: @work_acceptance_note.delivery_date, delivery_detail: @work_acceptance_note.delivery_detail, desc: @work_acceptance_note.desc, discard_at: @work_acceptance_note.discard_at, incoterm_desc: @work_acceptance_note.incoterm_desc, incoterm_id: @work_acceptance_note.incoterm_id, internal_org_id: @work_acceptance_note.internal_org_id, name: @work_acceptance_note.name, number: @work_acceptance_note.number, payment_term_desc: @work_acceptance_note.payment_term_desc, payment_term_number: @work_acceptance_note.payment_term_number, plant_id: @work_acceptance_note.plant_id, purch_group_id: @work_acceptance_note.purch_group_id, purch_order_id: @work_acceptance_note.purch_order_id, purch_org_id: @work_acceptance_note.purch_org_id, receiver: @work_acceptance_note.receiver, reference_by_id: @work_acceptance_note.reference_by_id, rejected_at: @work_acceptance_note.rejected_at, released_at: @work_acceptance_note.released_at, remark: @work_acceptance_note.remark, request_type: @work_acceptance_note.request_type, request_type_code: @work_acceptance_note.request_type_code, sap_number: @work_acceptance_note.sap_number, state: @work_acceptance_note.state, to_currency: @work_acceptance_note.to_currency, vendor_id: @work_acceptance_note.vendor_id, wan_type: @work_acceptance_note.wan_type } }
    end

    assert_redirected_to work_acceptance_note_url(WorkAcceptanceNote.last)
  end

  test "should show work_acceptance_note" do
    get work_acceptance_note_url(@work_acceptance_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_acceptance_note_url(@work_acceptance_note)
    assert_response :success
  end

  test "should update work_acceptance_note" do
    patch work_acceptance_note_url(@work_acceptance_note), params: { work_acceptance_note: { cancel_remark: @work_acceptance_note.cancel_remark, current_workflow_instance_id: @work_acceptance_note.current_workflow_instance_id, data: @work_acceptance_note.data, delivery_date: @work_acceptance_note.delivery_date, delivery_detail: @work_acceptance_note.delivery_detail, desc: @work_acceptance_note.desc, discard_at: @work_acceptance_note.discard_at, incoterm_desc: @work_acceptance_note.incoterm_desc, incoterm_id: @work_acceptance_note.incoterm_id, internal_org_id: @work_acceptance_note.internal_org_id, name: @work_acceptance_note.name, number: @work_acceptance_note.number, payment_term_desc: @work_acceptance_note.payment_term_desc, payment_term_number: @work_acceptance_note.payment_term_number, plant_id: @work_acceptance_note.plant_id, purch_group_id: @work_acceptance_note.purch_group_id, purch_order_id: @work_acceptance_note.purch_order_id, purch_org_id: @work_acceptance_note.purch_org_id, receiver: @work_acceptance_note.receiver, reference_by_id: @work_acceptance_note.reference_by_id, rejected_at: @work_acceptance_note.rejected_at, released_at: @work_acceptance_note.released_at, remark: @work_acceptance_note.remark, request_type: @work_acceptance_note.request_type, request_type_code: @work_acceptance_note.request_type_code, sap_number: @work_acceptance_note.sap_number, state: @work_acceptance_note.state, to_currency: @work_acceptance_note.to_currency, vendor_id: @work_acceptance_note.vendor_id, wan_type: @work_acceptance_note.wan_type } }
    assert_redirected_to work_acceptance_note_url(@work_acceptance_note)
  end

  test "should destroy work_acceptance_note" do
    assert_difference("WorkAcceptanceNote.count", -1) do
      delete work_acceptance_note_url(@work_acceptance_note)
    end

    assert_redirected_to work_acceptance_notes_url
  end
end
