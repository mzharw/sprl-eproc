require "application_system_test_case"

class PurchOrgsTest < ApplicationSystemTestCase
  setup do
    @purch_org = purch_orgs(:one)
  end

  test "visiting the index" do
    visit purch_orgs_url
    assert_selector "h1", text: "Purch orgs"
  end

  test "should create purch org" do
    visit purch_orgs_url
    click_on "New purch org"

    fill_in "App", with: @purch_org.app_id
    fill_in "Code", with: @purch_org.code
    fill_in "From date", with: @purch_org.from_date
    fill_in "Party", with: @purch_org.party_id
    fill_in "Thru date", with: @purch_org.thru_date
    click_on "Create Purch org"

    assert_text "Purch org was successfully created"
    click_on "Back"
  end

  test "should update Purch org" do
    visit purch_org_url(@purch_org)
    click_on "Edit this purch org", match: :first

    fill_in "App", with: @purch_org.app_id
    fill_in "Code", with: @purch_org.code
    fill_in "From date", with: @purch_org.from_date
    fill_in "Party", with: @purch_org.party_id
    fill_in "Thru date", with: @purch_org.thru_date
    click_on "Update Purch org"

    assert_text "Purch org was successfully updated"
    click_on "Back"
  end

  test "should destroy Purch org" do
    visit purch_org_url(@purch_org)
    click_on "Destroy this purch org", match: :first

    assert_text "Purch org was successfully destroyed"
  end
end
