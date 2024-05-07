require "test_helper"

class LatihansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @latihan = latihans(:one)
  end

  test "should get index" do
    get latihans_url
    assert_response :success
  end

  test "should get new" do
    get new_latihan_url
    assert_response :success
  end

  test "should create latihan" do
    assert_difference("Latihan.count") do
      post latihans_url, params: { latihan: { text: @latihan.text } }
    end

    assert_redirected_to latihan_url(Latihan.last)
  end

  test "should show latihan" do
    get latihan_url(@latihan)
    assert_response :success
  end

  test "should get edit" do
    get edit_latihan_url(@latihan)
    assert_response :success
  end

  test "should update latihan" do
    patch latihan_url(@latihan), params: { latihan: { text: @latihan.text } }
    assert_redirected_to latihan_url(@latihan)
  end

  test "should destroy latihan" do
    assert_difference("Latihan.count", -1) do
      delete latihan_url(@latihan)
    end

    assert_redirected_to latihans_url
  end
end
