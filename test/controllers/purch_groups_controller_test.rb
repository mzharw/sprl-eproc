require "test_helper"

class PurchGroupsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @purch_group = purch_groups(:one)
  # end

  # test "should get index" do
  #   get purch_groups_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_purch_group_url
  #   assert_response :success
  # end

  # test "should create purch_group" do
  #   assert_difference("PurchGroup.count") do
  #     post purch_groups_url, params: { purch_group: { account_holder: @purch_group.account_holder, account_number: @purch_group.account_number, commentcement_date: @purch_group.commentcement_date, contract: @purch_group.contract, cost_center_id: @purch_group.cost_center_id, created_at: @purch_group.created_at, current_workflow_instance_id: @purch_group.current_workflow_instance_id, data: @purch_group.data, delivery_detail: @purch_group.delivery_detail, delivery_location: @purch_group.delivery_location, discarded_at: @purch_group.discarded_at, finished_at: @purch_group.finished_at, finished_by_id: @purch_group.finished_by_id, incoterm_desc: @purch_group.incoterm_desc, incoterm_id: @purch_group.incoterm_id, internal_org_id: @purch_group.internal_org_id, is_replicated: @purch_group.is_replicated, issued_date: @purch_group.issued_date, length_of_work: @purch_group.length_of_work, name: @purch_group.name, number: @purch_group.number, payment_term_desc: @purch_group.payment_term_desc, payment_term_id: @purch_group.payment_term_id, payment_term_number: @purch_group.payment_term_number, plant_id: @purch_group.plant_id, po_signing: @purch_group.po_signing, po_to_amount: @purch_group.po_to_amount, po_type: @purch_group.po_type, prcmt_id: @purch_group.prcmt_id, purch_group_id: @purch_group.purch_group_id, purch_order_type_id: @purch_group.purch_order_type_id, purch_org_id: @purch_group.purch_org_id, referrable_id: @purch_group.referrable_id, referrable_type: @purch_group.referrable_type, rejected_at: @purch_group.rejected_at, remark: @purch_group.remark, scope_of_work: @purch_group.scope_of_work, state: @purch_group.state, tax_policy: @purch_group.tax_policy, to_currency_id: @purch_group.to_currency_id, uncommit_remark: @purch_group.uncommit_remark, updated_at: @purch_group.updated_at, used_up: @purch_group.used_up, validity_start_date: @purch_group.validity_start_date, vendor_id: @purch_group.vendor_id } }
  #   end

  #   assert_redirected_to purch_group_url(PurchGroup.last)
  # end

  # test "should show purch_group" do
  #   get purch_group_url(@purch_group)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_purch_group_url(@purch_group)
  #   assert_response :success
  # end

  # test "should update purch_group" do
  #   patch purch_group_url(@purch_group), params: { purch_group: { account_holder: @purch_group.account_holder, account_number: @purch_group.account_number, commentcement_date: @purch_group.commentcement_date, contract: @purch_group.contract, cost_center_id: @purch_group.cost_center_id, created_at: @purch_group.created_at, current_workflow_instance_id: @purch_group.current_workflow_instance_id, data: @purch_group.data, delivery_detail: @purch_group.delivery_detail, delivery_location: @purch_group.delivery_location, discarded_at: @purch_group.discarded_at, finished_at: @purch_group.finished_at, finished_by_id: @purch_group.finished_by_id, incoterm_desc: @purch_group.incoterm_desc, incoterm_id: @purch_group.incoterm_id, internal_org_id: @purch_group.internal_org_id, is_replicated: @purch_group.is_replicated, issued_date: @purch_group.issued_date, length_of_work: @purch_group.length_of_work, name: @purch_group.name, number: @purch_group.number, payment_term_desc: @purch_group.payment_term_desc, payment_term_id: @purch_group.payment_term_id, payment_term_number: @purch_group.payment_term_number, plant_id: @purch_group.plant_id, po_signing: @purch_group.po_signing, po_to_amount: @purch_group.po_to_amount, po_type: @purch_group.po_type, prcmt_id: @purch_group.prcmt_id, purch_group_id: @purch_group.purch_group_id, purch_order_type_id: @purch_group.purch_order_type_id, purch_org_id: @purch_group.purch_org_id, referrable_id: @purch_group.referrable_id, referrable_type: @purch_group.referrable_type, rejected_at: @purch_group.rejected_at, remark: @purch_group.remark, scope_of_work: @purch_group.scope_of_work, state: @purch_group.state, tax_policy: @purch_group.tax_policy, to_currency_id: @purch_group.to_currency_id, uncommit_remark: @purch_group.uncommit_remark, updated_at: @purch_group.updated_at, used_up: @purch_group.used_up, validity_start_date: @purch_group.validity_start_date, vendor_id: @purch_group.vendor_id } }
  #   assert_redirected_to purch_group_url(@purch_group)
  # end

  # test "should destroy purch_group" do
  #   assert_difference("PurchGroup.count", -1) do
  #     delete purch_group_url(@purch_group)
  #   end

  #   assert_redirected_to purch_groups_url
  # end
end
