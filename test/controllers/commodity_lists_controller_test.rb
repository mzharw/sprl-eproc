require "test_helper"

class CommodityListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commodity_list = commodity_lists(:one)
  end

  test "should get index" do
    get commodity_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_commodity_list_url
    assert_response :success
  end

  test "should create commodity_list" do
    assert_difference("CommodityList.count") do
      post commodity_lists_url, params: { commodity_list: { commodity_list_id: @commodity_list.commodity_list_id, created_by_id: @commodity_list.created_by_id, desc: @commodity_list.description, number: @commodity_list.number, updated_by_id: @commodity_list.updated_by_id } }
    end

    assert_redirected_to commodity_list_url(CommodityList.last)
  end

  test "should show commodity_list" do
    get commodity_list_url(@commodity_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_commodity_list_url(@commodity_list)
    assert_response :success
  end

  test "should update commodity_list" do
    patch commodity_list_url(@commodity_list), params: { commodity_list: { commodity_list_id: @commodity_list.commodity_list_id, created_by_id: @commodity_list.created_by_id, desc: @commodity_list.description, number: @commodity_list.number, updated_by_id: @commodity_list.updated_by_id } }
    assert_redirected_to commodity_list_url(@commodity_list)
  end

  test "should destroy commodity_list" do
    assert_difference("CommodityList.count", -1) do
      delete commodity_list_url(@commodity_list)
    end

    assert_redirected_to commodity_lists_url
  end
end
