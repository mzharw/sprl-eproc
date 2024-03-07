require "test_helper"

class VendorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor_type = vendor_types(:one)
  end

  test "should get index" do
    get vendor_types_url
    assert_response :success
  end

  test "should get new" do
    get new_vendor_type_url
    assert_response :success
  end

  test "should create vendor_type" do
    assert_difference("VendorType.count") do
      post vendor_types_url, params: { vendor_type: { created_at: @vendor_type.created_at, created_by_id: @vendor_type.created_by_id, desc: @vendor_type.desc, ident_name: @vendor_type.ident_name, name: @vendor_type.name, system: @vendor_type.system, updated_at: @vendor_type.updated_at, updated_by_id: @vendor_type.updated_by_id } }
    end

    assert_redirected_to vendor_type_url(VendorType.last)
  end

  test "should show vendor_type" do
    get vendor_type_url(@vendor_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_vendor_type_url(@vendor_type)
    assert_response :success
  end

  test "should update vendor_type" do
    patch vendor_type_url(@vendor_type), params: { vendor_type: { created_at: @vendor_type.created_at, created_by_id: @vendor_type.created_by_id, desc: @vendor_type.desc, ident_name: @vendor_type.ident_name, name: @vendor_type.name, system: @vendor_type.system, updated_at: @vendor_type.updated_at, updated_by_id: @vendor_type.updated_by_id } }
    assert_redirected_to vendor_type_url(@vendor_type)
  end

  test "should destroy vendor_type" do
    assert_difference("VendorType.count", -1) do
      delete vendor_type_url(@vendor_type)
    end

    assert_redirected_to vendor_types_url
  end
end
