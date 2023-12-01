require "test_helper"

class PurchOrgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_org = purch_orgs(:one)
  end

  test "should get index" do
    get purch_orgs_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_org_url
    assert_response :success
  end

  test "should create purch_org" do
    assert_difference("PurchOrg.count") do
      post purch_orgs_url, params: { purch_org: { app_id: @purch_org.app_id, code: @purch_org.code, from_date: @purch_org.from_date, party_id: @purch_org.party_id, thru_date: @purch_org.thru_date } }
    end

    assert_redirected_to purch_org_url(PurchOrg.last)
  end

  test "should show purch_org" do
    get purch_org_url(@purch_org)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_org_url(@purch_org)
    assert_response :success
  end

  test "should update purch_org" do
    patch purch_org_url(@purch_org), params: { purch_org: { app_id: @purch_org.app_id, code: @purch_org.code, from_date: @purch_org.from_date, party_id: @purch_org.party_id, thru_date: @purch_org.thru_date } }
    assert_redirected_to purch_org_url(@purch_org)
  end

  test "should destroy purch_org" do
    assert_difference("PurchOrg.count", -1) do
      delete purch_org_url(@purch_org)
    end

    assert_redirected_to purch_orgs_url
  end
end
