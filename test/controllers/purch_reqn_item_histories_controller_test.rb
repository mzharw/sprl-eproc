require "test_helper"

class PurchReqnItemHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_item_history = purch_reqn_item_histories(:one)
  end

  test "should get index" do
    get purch_reqn_item_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_item_history_url
    assert_response :success
  end

  test "should create purch_reqn_item_history" do
    assert_difference("PurchReqnItemHistory.count") do
      post purch_reqn_item_histories_url, params: { purch_reqn_item_history: { app_id: @purch_reqn_item_history.app_id, created_by: @purch_reqn_item_history.created_by, desc: @purch_reqn_item_history.desc, finished_at: @purch_reqn_item_history.finished_at, purch_reqn_item_id: @purch_reqn_item_history.purch_reqn_item_id, schedule_id: @purch_reqn_item_history.schedule_id, system: @purch_reqn_item_history.system, updated_by_id: @purch_reqn_item_history.updated_by_id, username: @purch_reqn_item_history.username } }
    end

    assert_redirected_to purch_reqn_item_history_url(PurchReqnItemHistory.last)
  end

  test "should show purch_reqn_item_history" do
    get purch_reqn_item_history_url(@purch_reqn_item_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_item_history_url(@purch_reqn_item_history)
    assert_response :success
  end

  test "should update purch_reqn_item_history" do
    patch purch_reqn_item_history_url(@purch_reqn_item_history), params: { purch_reqn_item_history: { app_id: @purch_reqn_item_history.app_id, created_by: @purch_reqn_item_history.created_by, desc: @purch_reqn_item_history.desc, finished_at: @purch_reqn_item_history.finished_at, purch_reqn_item_id: @purch_reqn_item_history.purch_reqn_item_id, schedule_id: @purch_reqn_item_history.schedule_id, system: @purch_reqn_item_history.system, updated_by_id: @purch_reqn_item_history.updated_by_id, username: @purch_reqn_item_history.username } }
    assert_redirected_to purch_reqn_item_history_url(@purch_reqn_item_history)
  end

  test "should destroy purch_reqn_item_history" do
    assert_difference("PurchReqnItemHistory.count", -1) do
      delete purch_reqn_item_history_url(@purch_reqn_item_history)
    end

    assert_redirected_to purch_reqn_item_histories_url
  end
end
