require "application_system_test_case"

class LatihansTest < ApplicationSystemTestCase
  setup do
    @latihan = latihans(:one)
  end

  test "visiting the index" do
    visit latihans_url
    assert_selector "h1", text: "Latihans"
  end

  test "should create latihan" do
    visit latihans_url
    click_on "New latihan"

    fill_in "Text", with: @latihan.text
    click_on "Create Latihan"

    assert_text "Latihan was successfully created"
    click_on "Back"
  end

  test "should update Latihan" do
    visit latihan_url(@latihan)
    click_on "Edit this latihan", match: :first

    fill_in "Text", with: @latihan.text
    click_on "Update Latihan"

    assert_text "Latihan was successfully updated"
    click_on "Back"
  end

  test "should destroy Latihan" do
    visit latihan_url(@latihan)
    click_on "Destroy this latihan", match: :first

    assert_text "Latihan was successfully destroyed"
  end
end
