require "test_helper"

class FacilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facility = facilities(:one)
  end

  test "should get index" do
    get facilities_url
    assert_response :success
  end

  test "should get new" do
    get new_facility_url
    assert_response :success
  end

  test "should create facility" do
    assert_difference("Facility.count") do
      post facilities_url, params: { facility: { created_at: @facility.created_at, created_by_id: @facility.created_by_id, facility_type: @facility.facility_type, name: @facility.name, updated_at: @facility.updated_at, updated_by_id: @facility.updated_by_id } }
    end

    assert_redirected_to facility_url(Facility.last)
  end

  test "should show facility" do
    get facility_url(@facility)
    assert_response :success
  end

  test "should get edit" do
    get edit_facility_url(@facility)
    assert_response :success
  end

  test "should update facility" do
    patch facility_url(@facility), params: { facility: { created_at: @facility.created_at, created_by_id: @facility.created_by_id, facility_type: @facility.facility_type, name: @facility.name, updated_at: @facility.updated_at, updated_by_id: @facility.updated_by_id } }
    assert_redirected_to facility_url(@facility)
  end

  test "should destroy facility" do
    assert_difference("Facility.count", -1) do
      delete facility_url(@facility)
    end

    assert_redirected_to facilities_url
  end
end
