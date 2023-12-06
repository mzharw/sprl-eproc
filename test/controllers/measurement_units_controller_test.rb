require "test_helper"

class MeasurementUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurement_unit = measurement_units(:one)
  end

  test "should get index" do
    get measurement_units_url
    assert_response :success
  end

  test "should get new" do
    get new_measurement_unit_url
    assert_response :success
  end

  test "should create measurement_unit" do
    assert_difference("MeasurementUnit.count") do
      post measurement_units_url, params: { measurement_unit: { app_id: @measurement_unit.app_id, created_at: @measurement_unit.created_at, created_by: @measurement_unit.created_by, desc: @measurement_unit.desc, dimid: @measurement_unit.dimid, ident_name: @measurement_unit.ident_name, name: @measurement_unit.name, symbol: @measurement_unit.symbol, updated_at: @measurement_unit.updated_at, updated_by: @measurement_unit.updated_by } }
    end

    assert_redirected_to measurement_unit_url(MeasurementUnit.last)
  end

  test "should show measurement_unit" do
    get measurement_unit_url(@measurement_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_measurement_unit_url(@measurement_unit)
    assert_response :success
  end

  test "should update measurement_unit" do
    patch measurement_unit_url(@measurement_unit), params: { measurement_unit: { app_id: @measurement_unit.app_id, created_at: @measurement_unit.created_at, created_by: @measurement_unit.created_by, desc: @measurement_unit.desc, dimid: @measurement_unit.dimid, ident_name: @measurement_unit.ident_name, name: @measurement_unit.name, symbol: @measurement_unit.symbol, updated_at: @measurement_unit.updated_at, updated_by: @measurement_unit.updated_by } }
    assert_redirected_to measurement_unit_url(@measurement_unit)
  end

  test "should destroy measurement_unit" do
    assert_difference("MeasurementUnit.count", -1) do
      delete measurement_unit_url(@measurement_unit)
    end

    assert_redirected_to measurement_units_url
  end
end
