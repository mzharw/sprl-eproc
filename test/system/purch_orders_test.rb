require "application_system_test_case"

class PurchOrdersTest < ApplicationSystemTestCase
  setup do
    @purch_order = purch_orders(:one)
  end

  test "visiting the index" do
    visit purch_orders_url
    assert_selector "h1", text: "Purch orders"
  end

  test "should create purch order" do
    visit purch_orders_url
    click_on "New purch order"

    fill_in "Account holder", with: @purch_order.account_holder
    fill_in "Account number", with: @purch_order.account_number
    fill_in "Commentcement date", with: @purch_order.commentcement_date
    check "Contract" if @purch_order.contract
    fill_in "Cost center", with: @purch_order.cost_center_id
    fill_in "Created at", with: @purch_order.created_at
    fill_in "Created by", with: @purch_order.created_by_id
    fill_in "Current workflow instance", with: @purch_order.current_workflow_instance_id
    fill_in "Data", with: @purch_order.data
    fill_in "Delivery detail", with: @purch_order.delivery_detail
    fill_in "Delivery location", with: @purch_order.delivery_location
    fill_in "Discarded at", with: @purch_order.discarded_at
    fill_in "Finished at", with: @purch_order.finished_at
    fill_in "Finished by", with: @purch_order.finished_by_id
    fill_in "Incoterm desc", with: @purch_order.incoterm_desc
    fill_in "Incoterm", with: @purch_order.incoterm_id
    fill_in "Internal org", with: @purch_order.internal_org_id
    check "Is replicated" if @purch_order.is_replicated
    fill_in "Issued date", with: @purch_order.issued_date
    fill_in "Length of work", with: @purch_order.length_of_work
    fill_in "Name", with: @purch_order.name
    fill_in "Number", with: @purch_order.number
    fill_in "Payment term desc", with: @purch_order.payment_term_desc
    fill_in "Payment term", with: @purch_order.payment_term_id
    fill_in "Payment term number", with: @purch_order.payment_term_number
    fill_in "Plant", with: @purch_order.plant_id
    fill_in "Po signing", with: @purch_order.po_signing
    fill_in "Po to amount", with: @purch_order.po_to_amount
    fill_in "Po type", with: @purch_order.po_type
    fill_in "Prcmt", with: @purch_order.prcmt_id
    fill_in "Purch group", with: @purch_order.purch_group_id
    fill_in "Purch order type", with: @purch_order.purch_order_type_id
    fill_in "Purch org", with: @purch_order.purch_org_id
    fill_in "Referrable", with: @purch_order.referrable_id
    fill_in "Referrable type", with: @purch_order.referrable_type
    fill_in "Rejected at", with: @purch_order.rejected_at
    fill_in "Remark", with: @purch_order.remark
    fill_in "Scope of work", with: @purch_order.scope_of_work
    fill_in "State", with: @purch_order.state
    check "Tax policy" if @purch_order.tax_policy
    fill_in "To currency", with: @purch_order.to_currency_id
    fill_in "Uncommit remark", with: @purch_order.uncommit_remark
    fill_in "Updated at", with: @purch_order.updated_at
    fill_in "Updated by", with: @purch_order.updated_by_id
    check "Used up" if @purch_order.used_up
    fill_in "Validity start date", with: @purch_order.validity_start_date
    fill_in "Vendor", with: @purch_order.vendor_id
    click_on "Create Purch order"

    assert_text "Purch order was successfully created"
    click_on "Back"
  end

  test "should update Purch order" do
    visit purch_order_url(@purch_order)
    click_on "Edit this purch order", match: :first

    fill_in "Account holder", with: @purch_order.account_holder
    fill_in "Account number", with: @purch_order.account_number
    fill_in "Commentcement date", with: @purch_order.commentcement_date
    check "Contract" if @purch_order.contract
    fill_in "Cost center", with: @purch_order.cost_center_id
    fill_in "Created at", with: @purch_order.created_at
    fill_in "Created by", with: @purch_order.created_by_id
    fill_in "Current workflow instance", with: @purch_order.current_workflow_instance_id
    fill_in "Data", with: @purch_order.data
    fill_in "Delivery detail", with: @purch_order.delivery_detail
    fill_in "Delivery location", with: @purch_order.delivery_location
    fill_in "Discarded at", with: @purch_order.discarded_at
    fill_in "Finished at", with: @purch_order.finished_at
    fill_in "Finished by", with: @purch_order.finished_by_id
    fill_in "Incoterm desc", with: @purch_order.incoterm_desc
    fill_in "Incoterm", with: @purch_order.incoterm_id
    fill_in "Internal org", with: @purch_order.internal_org_id
    check "Is replicated" if @purch_order.is_replicated
    fill_in "Issued date", with: @purch_order.issued_date
    fill_in "Length of work", with: @purch_order.length_of_work
    fill_in "Name", with: @purch_order.name
    fill_in "Number", with: @purch_order.number
    fill_in "Payment term desc", with: @purch_order.payment_term_desc
    fill_in "Payment term", with: @purch_order.payment_term_id
    fill_in "Payment term number", with: @purch_order.payment_term_number
    fill_in "Plant", with: @purch_order.plant_id
    fill_in "Po signing", with: @purch_order.po_signing
    fill_in "Po to amount", with: @purch_order.po_to_amount
    fill_in "Po type", with: @purch_order.po_type
    fill_in "Prcmt", with: @purch_order.prcmt_id
    fill_in "Purch group", with: @purch_order.purch_group_id
    fill_in "Purch order type", with: @purch_order.purch_order_type_id
    fill_in "Purch org", with: @purch_order.purch_org_id
    fill_in "Referrable", with: @purch_order.referrable_id
    fill_in "Referrable type", with: @purch_order.referrable_type
    fill_in "Rejected at", with: @purch_order.rejected_at
    fill_in "Remark", with: @purch_order.remark
    fill_in "Scope of work", with: @purch_order.scope_of_work
    fill_in "State", with: @purch_order.state
    check "Tax policy" if @purch_order.tax_policy
    fill_in "To currency", with: @purch_order.to_currency_id
    fill_in "Uncommit remark", with: @purch_order.uncommit_remark
    fill_in "Updated at", with: @purch_order.updated_at
    fill_in "Updated by", with: @purch_order.updated_by_id
    check "Used up" if @purch_order.used_up
    fill_in "Validity start date", with: @purch_order.validity_start_date
    fill_in "Vendor", with: @purch_order.vendor_id
    click_on "Update Purch order"

    assert_text "Purch order was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch order" do
    visit purch_order_url(@purch_order)
    click_on "Destroy this purch order", match: :first

    assert_text "Purch order was successfully destroyed"
  end
end
