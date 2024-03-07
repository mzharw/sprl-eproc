require "test_helper"

class PurchOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_order = purch_orders(:one)
  end

  test "should get index" do
    get purch_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_order_url
    assert_response :success
  end

  test "should create purch_order" do
    assert_difference("PurchOrder.count") do
      post purch_orders_url, params: { purch_order: { account_holder: @purch_order.account_holder, account_number: @purch_order.account_number, commentcement_date: @purch_order.commentcement_date, contract: @purch_order.contract, cost_center_id: @purch_order.cost_center_id, created_at: @purch_order.created_at, created_by_id: @purch_order.created_by_id, current_workflow_instance_id: @purch_order.current_workflow_instance_id, data: @purch_order.data, delivery_detail: @purch_order.delivery_detail, delivery_location: @purch_order.delivery_location, discarded_at: @purch_order.discarded_at, finished_at: @purch_order.finished_at, finished_by_id: @purch_order.finished_by_id, incoterm_desc: @purch_order.incoterm_desc, incoterm_id: @purch_order.incoterm_id, internal_org_id: @purch_order.internal_org_id, is_replicated: @purch_order.is_replicated, issued_date: @purch_order.issued_date, length_of_work: @purch_order.length_of_work, name: @purch_order.name, number: @purch_order.number, payment_term_desc: @purch_order.payment_term_desc, payment_term_id: @purch_order.payment_term_id, payment_term_number: @purch_order.payment_term_number, plant_id: @purch_order.plant_id, po_signing: @purch_order.po_signing, po_to_amount: @purch_order.po_to_amount, po_type: @purch_order.po_type, prcmt_id: @purch_order.prcmt_id, purch_group_id: @purch_order.purch_group_id, purch_order_type_id: @purch_order.purch_order_type_id, purch_org_id: @purch_order.purch_org_id, referrable_id: @purch_order.referrable_id, referrable_type: @purch_order.referrable_type, rejected_at: @purch_order.rejected_at, remark: @purch_order.remark, scope_of_work: @purch_order.scope_of_work, state: @purch_order.state, tax_policy: @purch_order.tax_policy, to_currency_id: @purch_order.to_currency_id, uncommit_remark: @purch_order.uncommit_remark, updated_at: @purch_order.updated_at, updated_by_id: @purch_order.updated_by_id, used_up: @purch_order.used_up, validity_start_date: @purch_order.validity_start_date, vendor_id: @purch_order.vendor_id } }
    end

    assert_redirected_to purch_order_url(PurchOrder.last)
  end

  test "should show purch_order" do
    get purch_order_url(@purch_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_order_url(@purch_order)
    assert_response :success
  end

  test "should update purch_order" do
    patch purch_order_url(@purch_order), params: { purch_order: { account_holder: @purch_order.account_holder, account_number: @purch_order.account_number, commentcement_date: @purch_order.commentcement_date, contract: @purch_order.contract, cost_center_id: @purch_order.cost_center_id, created_at: @purch_order.created_at, created_by_id: @purch_order.created_by_id, current_workflow_instance_id: @purch_order.current_workflow_instance_id, data: @purch_order.data, delivery_detail: @purch_order.delivery_detail, delivery_location: @purch_order.delivery_location, discarded_at: @purch_order.discarded_at, finished_at: @purch_order.finished_at, finished_by_id: @purch_order.finished_by_id, incoterm_desc: @purch_order.incoterm_desc, incoterm_id: @purch_order.incoterm_id, internal_org_id: @purch_order.internal_org_id, is_replicated: @purch_order.is_replicated, issued_date: @purch_order.issued_date, length_of_work: @purch_order.length_of_work, name: @purch_order.name, number: @purch_order.number, payment_term_desc: @purch_order.payment_term_desc, payment_term_id: @purch_order.payment_term_id, payment_term_number: @purch_order.payment_term_number, plant_id: @purch_order.plant_id, po_signing: @purch_order.po_signing, po_to_amount: @purch_order.po_to_amount, po_type: @purch_order.po_type, prcmt_id: @purch_order.prcmt_id, purch_group_id: @purch_order.purch_group_id, purch_order_type_id: @purch_order.purch_order_type_id, purch_org_id: @purch_order.purch_org_id, referrable_id: @purch_order.referrable_id, referrable_type: @purch_order.referrable_type, rejected_at: @purch_order.rejected_at, remark: @purch_order.remark, scope_of_work: @purch_order.scope_of_work, state: @purch_order.state, tax_policy: @purch_order.tax_policy, to_currency_id: @purch_order.to_currency_id, uncommit_remark: @purch_order.uncommit_remark, updated_at: @purch_order.updated_at, updated_by_id: @purch_order.updated_by_id, used_up: @purch_order.used_up, validity_start_date: @purch_order.validity_start_date, vendor_id: @purch_order.vendor_id } }
    assert_redirected_to purch_order_url(@purch_order)
  end

  test "should destroy purch_order" do
    assert_difference("PurchOrder.count", -1) do
      delete purch_order_url(@purch_order)
    end

    assert_redirected_to purch_orders_url
  end
end
