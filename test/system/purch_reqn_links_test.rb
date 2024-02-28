require "application_system_test_case"

class PurchReqnLinksTest < ApplicationSystemTestCase
  setup do
    @purch_reqn_link = purch_reqn_links(:one)
  end

  test "visiting the index" do
    visit purch_reqn_links_url
    assert_selector "h1", text: "Purch reqn links"
  end

  test "should create purch reqn link" do
    visit purch_reqn_links_url
    click_on "New purch reqn link"

    fill_in "Desc", with: @purch_reqn_link.desc
    fill_in "From purch reqn", with: @purch_reqn_link.from_purch_reqn_id
    fill_in "Purch reqn link type", with: @purch_reqn_link.purch_reqn_link_type_id
    fill_in "To purch reqn", with: @purch_reqn_link.to_purch_reqn_id
    click_on "Create Purch reqn link"

    assert_text "Purch reqn link was successfully created"
    click_on "Back"
  end

  test "should update Purch reqn link" do
    visit purch_reqn_link_url(@purch_reqn_link)
    click_on "Edit this purch reqn link", match: :first

    fill_in "Desc", with: @purch_reqn_link.desc
    fill_in "From purch reqn", with: @purch_reqn_link.from_purch_reqn_id
    fill_in "Purch reqn link type", with: @purch_reqn_link.purch_reqn_link_type_id
    fill_in "To purch reqn", with: @purch_reqn_link.to_purch_reqn_id
    click_on "Update Purch reqn link"

    assert_text "Purch reqn link was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch reqn link" do
    visit purch_reqn_link_url(@purch_reqn_link)
    click_on "Destroy this purch reqn link", match: :first

    assert_text "Purch reqn link was successfully destroyed"
  end
end
