require "test_helper"

class PurchReqnLinkTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_link_type = purch_reqn_link_types(:one)
  end

  test "should get index" do
    get purch_reqn_link_types_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_link_type_url
    assert_response :success
  end

  test "should create purch_reqn_link_type" do
    assert_difference("PurchReqnLinkType.count") do
      post purch_reqn_link_types_url, params: { purch_reqn_link_type: { created_by_id: @purch_reqn_link_type.created_by_id, desc: @purch_reqn_link_type.desc, ident_name: @purch_reqn_link_type.ident_name, name: @purch_reqn_link_type.name, system: @purch_reqn_link_type.system, updated_by_id: @purch_reqn_link_type.updated_by_id } }
    end

    assert_redirected_to purch_reqn_link_type_url(PurchReqnLinkType.last)
  end

  test "should show purch_reqn_link_type" do
    get purch_reqn_link_type_url(@purch_reqn_link_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_link_type_url(@purch_reqn_link_type)
    assert_response :success
  end

  test "should update purch_reqn_link_type" do
    patch purch_reqn_link_type_url(@purch_reqn_link_type), params: { purch_reqn_link_type: { created_by_id: @purch_reqn_link_type.created_by_id, desc: @purch_reqn_link_type.desc, ident_name: @purch_reqn_link_type.ident_name, name: @purch_reqn_link_type.name, system: @purch_reqn_link_type.system, updated_by_id: @purch_reqn_link_type.updated_by_id } }
    assert_redirected_to purch_reqn_link_type_url(@purch_reqn_link_type)
  end

  test "should destroy purch_reqn_link_type" do
    assert_difference("PurchReqnLinkType.count", -1) do
      delete purch_reqn_link_type_url(@purch_reqn_link_type)
    end

    assert_redirected_to purch_reqn_link_types_url
  end
end
