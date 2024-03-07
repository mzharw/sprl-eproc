require "test_helper"

class VendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get vendors_url
    assert_response :success
  end

  test "should get new" do
    get new_vendor_url
    assert_response :success
  end

  test "should create vendor" do
    assert_difference("Vendor.count") do
      post vendors_url, params: { vendor: { active_vendor_status_id: @vendor.active_vendor_status_id, code: @vendor.code, created_at: @vendor.created_at, created_by_id: @vendor.created_by_id, data: @vendor.data, from_date: @vendor.from_date, state: @vendor.state, thru_date: @vendor.thru_date, updated_at: @vendor.updated_at, updated_by_id: @vendor.updated_by_id, vendor_type_id: @vendor.vendor_type_id } }
    end

    assert_redirected_to vendor_url(Vendor.last)
  end

  test "should show vendor" do
    get vendor_url(@vendor)
    assert_response :success
  end

  test "should get edit" do
    get edit_vendor_url(@vendor)
    assert_response :success
  end

  test "should update vendor" do
    patch vendor_url(@vendor), params: { vendor: { active_vendor_status_id: @vendor.active_vendor_status_id, code: @vendor.code, created_at: @vendor.created_at, created_by_id: @vendor.created_by_id, data: @vendor.data, from_date: @vendor.from_date, state: @vendor.state, thru_date: @vendor.thru_date, updated_at: @vendor.updated_at, updated_by_id: @vendor.updated_by_id, vendor_type_id: @vendor.vendor_type_id } }
    assert_redirected_to vendor_url(@vendor)
  end

  test "should destroy vendor" do
    assert_difference("Vendor.count", -1) do
      delete vendor_url(@vendor)
    end

    assert_redirected_to vendors_url
  end
end
