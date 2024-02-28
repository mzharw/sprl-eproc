require "application_system_test_case"

class PurchGroupsTest < ApplicationSystemTestCase
  setup do
    @purch_group = purch_groups(:one)
  end

  test "visiting the index" do
    visit purch_groups_url
    assert_selector "h1", text: "Purch groups"
  end

  test "should create purch group" do
    visit purch_groups_url
    click_on "New purch group"

    fill_in "Account holder", with: @purch_group.account_holder
    fill_in "Account number", with: @purch_group.account_number
    fill_in "Commentcement date", with: @purch_group.commentcement_date
    check "Contract" if @purch_group.contract
    fill_in "Cost center", with: @purch_group.cost_center_id
    fill_in "Created at", with: @purch_group.created_at
    fill_in "Current workflow instance", with: @purch_group.current_workflow_instance_id
    fill_in "Data", with: @purch_group.data
    fill_in "Delivery detail", with: @purch_group.delivery_detail
    fill_in "Delivery location", with: @purch_group.delivery_location
    fill_in "Discarded at", with: @purch_group.discarded_at
    fill_in "Finished at", with: @purch_group.finished_at
    fill_in "Finished by", with: @purch_group.finished_by_id
    fill_in "Incoterm desc", with: @purch_group.incoterm_desc
    fill_in "Incoterm", with: @purch_group.incoterm_id
    fill_in "Internal org", with: @purch_group.internal_org_id
    check "Is replicated" if @purch_group.is_replicated
    fill_in "Issued date", with: @purch_group.issued_date
    fill_in "Length of work", with: @purch_group.length_of_work
    fill_in "Name", with: @purch_group.name
    fill_in "Number", with: @purch_group.number
    fill_in "Payment term desc", with: @purch_group.payment_term_desc
    fill_in "Payment term", with: @purch_group.payment_term_id
    fill_in "Payment term number", with: @purch_group.payment_term_number
    fill_in "Plant", with: @purch_group.plant_id
    fill_in "Po signing", with: @purch_group.po_signing
    fill_in "Po to amount", with: @purch_group.po_to_amount
    fill_in "Po type", with: @purch_group.po_type
    fill_in "Prcmt", with: @purch_group.prcmt_id
    fill_in "Purch group", with: @purch_group.purch_group_id
    fill_in "Purch order type", with: @purch_group.purch_order_type_id
    fill_in "Purch org", with: @purch_group.purch_org_id
    fill_in "Referrable", with: @purch_group.referrable_id
    fill_in "Referrable type", with: @purch_group.referrable_type
    fill_in "Rejected at", with: @purch_group.rejected_at
    fill_in "Remark", with: @purch_group.remark
    fill_in "Scope of work", with: @purch_group.scope_of_work
    fill_in "State", with: @purch_group.state
    check "Tax policy" if @purch_group.tax_policy
    fill_in "To currency", with: @purch_group.to_currency_id
    fill_in "Uncommit remark", with: @purch_group.uncommit_remark
    fill_in "Updated at", with: @purch_group.updated_at
    check "Used up" if @purch_group.used_up
    fill_in "Validity start date", with: @purch_group.validity_start_date
    fill_in "Vendor", with: @purch_group.vendor_id
    click_on "Create Purch group"

    assert_text "Purch group was successfully created"
    click_on "Back"
  end

  test "should update Purch group" do
    visit purch_group_url(@purch_group)
    click_on "Edit this purch group", match: :first

    fill_in "Account holder", with: @purch_group.account_holder
    fill_in "Account number", with: @purch_group.account_number
    fill_in "Commentcement date", with: @purch_group.commentcement_date
    check "Contract" if @purch_group.contract
    fill_in "Cost center", with: @purch_group.cost_center_id
    fill_in "Created at", with: @purch_group.created_at
    fill_in "Current workflow instance", with: @purch_group.current_workflow_instance_id
    fill_in "Data", with: @purch_group.data
    fill_in "Delivery detail", with: @purch_group.delivery_detail
    fill_in "Delivery location", with: @purch_group.delivery_location
    fill_in "Discarded at", with: @purch_group.discarded_at
    fill_in "Finished at", with: @purch_group.finished_at
    fill_in "Finished by", with: @purch_group.finished_by_id
    fill_in "Incoterm desc", with: @purch_group.incoterm_desc
    fill_in "Incoterm", with: @purch_group.incoterm_id
    fill_in "Internal org", with: @purch_group.internal_org_id
    check "Is replicated" if @purch_group.is_replicated
    fill_in "Issued date", with: @purch_group.issued_date
    fill_in "Length of work", with: @purch_group.length_of_work
    fill_in "Name", with: @purch_group.name
    fill_in "Number", with: @purch_group.number
    fill_in "Payment term desc", with: @purch_group.payment_term_desc
    fill_in "Payment term", with: @purch_group.payment_term_id
    fill_in "Payment term number", with: @purch_group.payment_term_number
    fill_in "Plant", with: @purch_group.plant_id
    fill_in "Po signing", with: @purch_group.po_signing
    fill_in "Po to amount", with: @purch_group.po_to_amount
    fill_in "Po type", with: @purch_group.po_type
    fill_in "Prcmt", with: @purch_group.prcmt_id
    fill_in "Purch group", with: @purch_group.purch_group_id
    fill_in "Purch order type", with: @purch_group.purch_order_type_id
    fill_in "Purch org", with: @purch_group.purch_org_id
    fill_in "Referrable", with: @purch_group.referrable_id
    fill_in "Referrable type", with: @purch_group.referrable_type
    fill_in "Rejected at", with: @purch_group.rejected_at
    fill_in "Remark", with: @purch_group.remark
    fill_in "Scope of work", with: @purch_group.scope_of_work
    fill_in "State", with: @purch_group.state
    check "Tax policy" if @purch_group.tax_policy
    fill_in "To currency", with: @purch_group.to_currency_id
    fill_in "Uncommit remark", with: @purch_group.uncommit_remark
    fill_in "Updated at", with: @purch_group.updated_at
    check "Used up" if @purch_group.used_up
    fill_in "Validity start date", with: @purch_group.validity_start_date
    fill_in "Vendor", with: @purch_group.vendor_id
    click_on "Update Purch group"

    assert_text "Purch group was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch group" do
    visit purch_group_url(@purch_group)
    click_on "Destroy this purch group", match: :first

    assert_text "Purch group was successfully destroyed"
  end
end
