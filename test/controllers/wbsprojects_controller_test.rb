require "test_helper"

class WbsprojectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wbsproject = wbsprojects(:one)
  end

  test "should get index" do
    get wbsprojects_url
    assert_response :success
  end

  test "should get new" do
    get new_wbsproject_url
    assert_response :success
  end

  test "should create wbsproject" do
    assert_difference("Wbsproject.count") do
      post wbsprojects_url, params: { wbsproject: { created_by_id: @wbsproject.created_by_id, ctrl_name: @wbsproject.ctrl_name, desc: @wbsproject.desc, istat: @wbsproject.istat, long_status: @wbsproject.long_status, object_number: @wbsproject.object_number, pack_long_status: @wbsproject.pack_long_status, pack_short_status: @wbsproject.pack_short_status, parent_id: @wbsproject.parent_id, payroll_id: @wbsproject.payroll_id, position: @wbsproject.position, responsible_cc_id: @wbsproject.responsible_cc_id, short_status: @wbsproject.short_status, updated_by_id: @wbsproject.updated_by_id, usr03: @wbsproject.usr03, wbs_id: @wbsproject.wbs_id } }
    end

    assert_redirected_to wbsproject_url(Wbsproject.last)
  end

  test "should show wbsproject" do
    get wbsproject_url(@wbsproject)
    assert_response :success
  end

  test "should get edit" do
    get edit_wbsproject_url(@wbsproject)
    assert_response :success
  end

  test "should update wbsproject" do
    patch wbsproject_url(@wbsproject), params: { wbsproject: { created_by_id: @wbsproject.created_by_id, ctrl_name: @wbsproject.ctrl_name, desc: @wbsproject.desc, istat: @wbsproject.istat, long_status: @wbsproject.long_status, object_number: @wbsproject.object_number, pack_long_status: @wbsproject.pack_long_status, pack_short_status: @wbsproject.pack_short_status, parent_id: @wbsproject.parent_id, payroll_id: @wbsproject.payroll_id, position: @wbsproject.position, responsible_cc_id: @wbsproject.responsible_cc_id, short_status: @wbsproject.short_status, updated_by_id: @wbsproject.updated_by_id, usr03: @wbsproject.usr03, wbs_id: @wbsproject.wbs_id } }
    assert_redirected_to wbsproject_url(@wbsproject)
  end

  test "should destroy wbsproject" do
    assert_difference("Wbsproject.count", -1) do
      delete wbsproject_url(@wbsproject)
    end

    assert_redirected_to wbsprojects_url
  end
end
