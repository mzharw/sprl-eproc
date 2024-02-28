require "application_system_test_case"

class ProductGroupsTest < ApplicationSystemTestCase
  setup do
    @product_group = product_groups(:one)
  end

  test "visiting the index" do
    visit product_groups_url
    assert_selector "h1", text: "Product groups"
  end

  test "should create product group" do
    visit product_groups_url
    click_on "New product group"

    fill_in "Code", with: @product_group.code
    fill_in "Created by", with: @product_group.created_by_id
    fill_in "Desc", with: @product_group.desc
    fill_in "Name", with: @product_group.name
    fill_in "Updated by", with: @product_group.updated_by_id
    click_on "Create Product group"

    assert_text "Product group was successfully created"
    click_on "Back"
  end

  test "should update Product group" do
    visit product_group_url(@product_group)
    click_on "Edit this product group", match: :first

    fill_in "Code", with: @product_group.code
    fill_in "Created by", with: @product_group.created_by_id
    fill_in "Desc", with: @product_group.desc
    fill_in "Name", with: @product_group.name
    fill_in "Updated by", with: @product_group.updated_by_id
    click_on "Update Product group"

    assert_text "Product group was successfully updated"
    click_on "Back"
  end

  test "should destroy Product group" do
    visit product_group_url(@product_group)
    click_on "Destroy this product group", match: :first

    assert_text "Product group was successfully destroyed"
  end
end
