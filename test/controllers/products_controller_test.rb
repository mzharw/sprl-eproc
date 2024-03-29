require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { code: @product.code, created_at: @product.created_at, created_by_id: @product.created_by_id, desc: @product.desc, measurement_unit_id: @product.measurement_unit_id, name: @product.name, product_group_id: @product.product_group_id, product_type: @product.product_type, updated_at: @product.updated_at, updated_by_id: @product.updated_by_id } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { code: @product.code, created_at: @product.created_at, created_by_id: @product.created_by_id, desc: @product.desc, measurement_unit_id: @product.measurement_unit_id, name: @product.name, product_group_id: @product.product_group_id, product_type: @product.product_type, updated_at: @product.updated_at, updated_by_id: @product.updated_by_id } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
