require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "App", with: @product.app_id
    fill_in "Code", with: @product.code
    fill_in "Created at", with: @product.created_at
    fill_in "Created by", with: @product.created_by_id
    fill_in "Desc", with: @product.desc
    fill_in "Measurement unit", with: @product.measurement_unit_id
    fill_in "Name", with: @product.name
    fill_in "Product group", with: @product.product_group_id
    fill_in "Product type", with: @product.product_type
    fill_in "Updated at", with: @product.updated_at
    fill_in "Updated by", with: @product.updated_by_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "App", with: @product.app_id
    fill_in "Code", with: @product.code
    fill_in "Created at", with: @product.created_at
    fill_in "Created by", with: @product.created_by_id
    fill_in "Desc", with: @product.desc
    fill_in "Measurement unit", with: @product.measurement_unit_id
    fill_in "Name", with: @product.name
    fill_in "Product group", with: @product.product_group_id
    fill_in "Product type", with: @product.product_type
    fill_in "Updated at", with: @product.updated_at
    fill_in "Updated by", with: @product.updated_by_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
