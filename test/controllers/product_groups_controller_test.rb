require "test_helper"

class ProductGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_group = product_groups(:one)
  end

  test "should get index" do
    get product_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_product_group_url
    assert_response :success
  end

  test "should create product_group" do
    assert_difference("ProductGroup.count") do
      post product_groups_url, params: { product_group: { code: @product_group.code, created_by_id: @product_group.created_by_id, desc: @product_group.desc, name: @product_group.name, updated_by_id: @product_group.updated_by_id } }
    end

    assert_redirected_to product_group_url(ProductGroup.last)
  end

  test "should show product_group" do
    get product_group_url(@product_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_group_url(@product_group)
    assert_response :success
  end

  test "should update product_group" do
    patch product_group_url(@product_group), params: { product_group: { code: @product_group.code, created_by_id: @product_group.created_by_id, desc: @product_group.desc, name: @product_group.name, updated_by_id: @product_group.updated_by_id } }
    assert_redirected_to product_group_url(@product_group)
  end

  test "should destroy product_group" do
    assert_difference("ProductGroup.count", -1) do
      delete product_group_url(@product_group)
    end

    assert_redirected_to product_groups_url
  end
end
