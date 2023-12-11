require "application_system_test_case"

class WorkAcceptanceNotesTest < ApplicationSystemTestCase
  setup do
    @work_acceptance_note = work_acceptance_notes(:one)
  end

  test "visiting the index" do
    visit work_acceptance_notes_url
    assert_selector "h1", text: "Work acceptance notes"
  end

  test "should create work acceptance note" do
    visit work_acceptance_notes_url
    click_on "New work acceptance note"

    fill_in "Cancel remark", with: @work_acceptance_note.cancel_remark
    fill_in "Current workflow instance", with: @work_acceptance_note.current_workflow_instance_id
    fill_in "Data", with: @work_acceptance_note.data
    fill_in "Delivery date", with: @work_acceptance_note.delivery_date
    fill_in "Delivery detail", with: @work_acceptance_note.delivery_detail
    fill_in "Desc", with: @work_acceptance_note.desc
    fill_in "Discard at", with: @work_acceptance_note.discard_at
    fill_in "Incoterm desc", with: @work_acceptance_note.incoterm_desc
    fill_in "Incoterm", with: @work_acceptance_note.incoterm_id
    fill_in "Internal org", with: @work_acceptance_note.internal_org_id
    fill_in "Name", with: @work_acceptance_note.name
    fill_in "Number", with: @work_acceptance_note.number
    fill_in "Payment term desc", with: @work_acceptance_note.payment_term_desc
    fill_in "Payment term number", with: @work_acceptance_note.payment_term_number
    fill_in "Plant", with: @work_acceptance_note.plant_id
    fill_in "Purch group", with: @work_acceptance_note.purch_group_id
    fill_in "Purch order", with: @work_acceptance_note.purch_order_id
    fill_in "Purch org", with: @work_acceptance_note.purch_org_id
    fill_in "Receiver", with: @work_acceptance_note.receiver
    fill_in "Reference by", with: @work_acceptance_note.reference_by_id
    fill_in "Rejected at", with: @work_acceptance_note.rejected_at
    fill_in "Released at", with: @work_acceptance_note.released_at
    fill_in "Remark", with: @work_acceptance_note.remark
    fill_in "Request type", with: @work_acceptance_note.request_type
    fill_in "Request type code", with: @work_acceptance_note.request_type_code
    fill_in "Sap number", with: @work_acceptance_note.sap_number
    fill_in "State", with: @work_acceptance_note.state
    fill_in "To currency", with: @work_acceptance_note.to_currency
    fill_in "Vendor", with: @work_acceptance_note.vendor_id
    fill_in "Wan type", with: @work_acceptance_note.wan_type
    click_on "Create Work acceptance note"

    assert_text "Work acceptance note was successfully created"
    click_on "Back"
  end

  test "should update Work acceptance note" do
    visit work_acceptance_note_url(@work_acceptance_note)
    click_on "Edit this work acceptance note", match: :first

    fill_in "Cancel remark", with: @work_acceptance_note.cancel_remark
    fill_in "Current workflow instance", with: @work_acceptance_note.current_workflow_instance_id
    fill_in "Data", with: @work_acceptance_note.data
    fill_in "Delivery date", with: @work_acceptance_note.delivery_date
    fill_in "Delivery detail", with: @work_acceptance_note.delivery_detail
    fill_in "Desc", with: @work_acceptance_note.desc
    fill_in "Discard at", with: @work_acceptance_note.discard_at
    fill_in "Incoterm desc", with: @work_acceptance_note.incoterm_desc
    fill_in "Incoterm", with: @work_acceptance_note.incoterm_id
    fill_in "Internal org", with: @work_acceptance_note.internal_org_id
    fill_in "Name", with: @work_acceptance_note.name
    fill_in "Number", with: @work_acceptance_note.number
    fill_in "Payment term desc", with: @work_acceptance_note.payment_term_desc
    fill_in "Payment term number", with: @work_acceptance_note.payment_term_number
    fill_in "Plant", with: @work_acceptance_note.plant_id
    fill_in "Purch group", with: @work_acceptance_note.purch_group_id
    fill_in "Purch order", with: @work_acceptance_note.purch_order_id
    fill_in "Purch org", with: @work_acceptance_note.purch_org_id
    fill_in "Receiver", with: @work_acceptance_note.receiver
    fill_in "Reference by", with: @work_acceptance_note.reference_by_id
    fill_in "Rejected at", with: @work_acceptance_note.rejected_at
    fill_in "Released at", with: @work_acceptance_note.released_at
    fill_in "Remark", with: @work_acceptance_note.remark
    fill_in "Request type", with: @work_acceptance_note.request_type
    fill_in "Request type code", with: @work_acceptance_note.request_type_code
    fill_in "Sap number", with: @work_acceptance_note.sap_number
    fill_in "State", with: @work_acceptance_note.state
    fill_in "To currency", with: @work_acceptance_note.to_currency
    fill_in "Vendor", with: @work_acceptance_note.vendor_id
    fill_in "Wan type", with: @work_acceptance_note.wan_type
    click_on "Update Work acceptance note"

    assert_text "Work acceptance note was successfully updated"
    click_on "Back"
  end

  test "should destroy Work acceptance note" do
    visit work_acceptance_note_url(@work_acceptance_note)
    click_on "Destroy this work acceptance note", match: :first

    assert_text "Work acceptance note was successfully destroyed"
  end
end
