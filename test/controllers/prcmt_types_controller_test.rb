\require "test_helper"

class PrcmtTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prcmt_type = prcmt_types(:one)
  end

  test "should get index" do
    get prcmt_types_url
    assert_response :success
  end

  test "should get new" do
    get new_prcmt_type_url
    assert_response :success
  end

  test "should create prcmt_type" do
    assert_difference("PrcmtType.count") do
      post prcmt_types_url, params: { prcmt_type: { desc: @prcmt_type.desc, ident_name: @prcmt_type.ident_name, name: @prcmt_type.name, system: @prcmt_type.system, visibility: @prcmt_type.visibility } }
    end

    assert_redirected_to prcmt_type_url(PrcmtType.last)
  end

  test "should show prcmt_type" do
    get prcmt_type_url(@prcmt_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_prcmt_type_url(@prcmt_type)
    assert_response :success
  end

  test "should update prcmt_type" do
    patch prcmt_type_url(@prcmt_type), params: { prcmt_type: { desc: @prcmt_type.desc, ident_name: @prcmt_type.ident_name, name: @prcmt_type.name, system: @prcmt_type.system, visibility: @prcmt_type.visibility } }
    assert_redirected_to prcmt_type_url(@prcmt_type)
  end

  test "should destroy prcmt_type" do
    assert_difference("PrcmtType.count", -1) do
      delete prcmt_type_url(@prcmt_type)
    end

    assert_redirected_to prcmt_types_url
  end
end
