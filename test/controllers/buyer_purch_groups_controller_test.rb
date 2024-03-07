require "test_helper"

class BuyerPurchGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer_purch_group = buyer_purch_groups(:one)
  end

  test "should get index" do
    get buyer_purch_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_purch_group_url
    assert_response :success
  end

  test "should create buyer_purch_group" do
    assert_difference("BuyerPurchGroup.count") do
      post buyer_purch_groups_url, params: { buyer_purch_group: { buyer: @buyer_purch_group.buyer, created_at: @buyer_purch_group.created_at, created_by_id: @buyer_purch_group.created_by_id, from_date: @buyer_purch_group.from_date, purch_group: @buyer_purch_group.purch_group, thru_date: @buyer_purch_group.thru_date, updated_at: @buyer_purch_group.updated_at, updated_by_id: @buyer_purch_group.updated_by_id } }
    end

    assert_redirected_to buyer_purch_group_url(BuyerPurchGroup.last)
  end

  test "should show buyer_purch_group" do
    get buyer_purch_group_url(@buyer_purch_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_purch_group_url(@buyer_purch_group)
    assert_response :success
  end

  test "should update buyer_purch_group" do
    patch buyer_purch_group_url(@buyer_purch_group), params: { buyer_purch_group: { buyer: @buyer_purch_group.buyer, created_at: @buyer_purch_group.created_at, created_by_id: @buyer_purch_group.created_by_id, from_date: @buyer_purch_group.from_date, purch_group: @buyer_purch_group.purch_group, thru_date: @buyer_purch_group.thru_date, updated_at: @buyer_purch_group.updated_at, updated_by_id: @buyer_purch_group.updated_by_id } }
    assert_redirected_to buyer_purch_group_url(@buyer_purch_group)
  end

  test "should destroy buyer_purch_group" do
    assert_difference("BuyerPurchGroup.count", -1) do
      delete buyer_purch_group_url(@buyer_purch_group)
    end

    assert_redirected_to buyer_purch_groups_url
  end
end
