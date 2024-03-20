require "application_system_test_case"

class WbsprojectsTest < ApplicationSystemTestCase
  setup do
    @wbsproject = wbsprojects(:one)
  end

  test "visiting the index" do
    visit wbsprojects_url
    assert_selector "h1", text: "Wbsprojects"
  end

  test "should create wbsproject" do
    visit wbsprojects_url
    click_on "New wbsproject"

    fill_in "Created by", with: @wbsproject.created_by_id
    fill_in "Ctrl name", with: @wbsproject.ctrl_name
    fill_in "Desc", with: @wbsproject.desc
    fill_in "Istat", with: @wbsproject.istat
    fill_in "Long status", with: @wbsproject.long_status
    fill_in "Object number", with: @wbsproject.object_number
    fill_in "Pack long status", with: @wbsproject.pack_long_status
    fill_in "Pack short status", with: @wbsproject.pack_short_status
    fill_in "Parent", with: @wbsproject.parent_id
    fill_in "Payroll", with: @wbsproject.payroll_id
    fill_in "Position", with: @wbsproject.position
    fill_in "Responsible cc", with: @wbsproject.responsible_cc_id
    fill_in "Short status", with: @wbsproject.short_status
    fill_in "Updated by", with: @wbsproject.updated_by_id
    fill_in "Usr03", with: @wbsproject.usr03
    fill_in "Wbs", with: @wbsproject.wbs_id
    click_on "Create Wbsproject"

    assert_text "Wbsproject was successfully created"
    click_on "Back"
  end

  test "should update Wbsproject" do
    visit wbsproject_url(@wbsproject)
    click_on "Edit this wbsproject", match: :first

    fill_in "Created by", with: @wbsproject.created_by_id
    fill_in "Ctrl name", with: @wbsproject.ctrl_name
    fill_in "Desc", with: @wbsproject.desc
    fill_in "Istat", with: @wbsproject.istat
    fill_in "Long status", with: @wbsproject.long_status
    fill_in "Object number", with: @wbsproject.object_number
    fill_in "Pack long status", with: @wbsproject.pack_long_status
    fill_in "Pack short status", with: @wbsproject.pack_short_status
    fill_in "Parent", with: @wbsproject.parent_id
    fill_in "Payroll", with: @wbsproject.payroll_id
    fill_in "Position", with: @wbsproject.position
    fill_in "Responsible cc", with: @wbsproject.responsible_cc_id
    fill_in "Short status", with: @wbsproject.short_status
    fill_in "Updated by", with: @wbsproject.updated_by_id
    fill_in "Usr03", with: @wbsproject.usr03
    fill_in "Wbs", with: @wbsproject.wbs_id
    click_on "Update Wbsproject"

    assert_text "Wbsproject was successfully updated"
    click_on "Back"
  end

  test "should destroy Wbsproject" do
    visit wbsproject_url(@wbsproject)
    click_on "Destroy this wbsproject", match: :first

    assert_text "Wbsproject was successfully destroyed"
  end
end
