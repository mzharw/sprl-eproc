require "test_helper"

class PurchReqnLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purch_reqn_link = purch_reqn_links(:one)
  end

  test "should get index" do
    get purch_reqn_links_url
    assert_response :success
  end

  test "should get new" do
    get new_purch_reqn_link_url
    assert_response :success
  end

  test "should create purch_reqn_link" do
    assert_difference("PurchReqnLink.count") do
      post purch_reqn_links_url, params: { purch_reqn_link: { desc: @purch_reqn_link.desc, from_purch_reqn_id: @purch_reqn_link.from_purch_reqn_id, purch_reqn_link_type_id: @purch_reqn_link.purch_reqn_link_type_id, to_purch_reqn_id: @purch_reqn_link.to_purch_reqn_id } }
    end

    assert_redirected_to purch_reqn_link_url(PurchReqnLink.last)
  end

  test "should show purch_reqn_link" do
    get purch_reqn_link_url(@purch_reqn_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_purch_reqn_link_url(@purch_reqn_link)
    assert_response :success
  end

  test "should update purch_reqn_link" do
    patch purch_reqn_link_url(@purch_reqn_link), params: { purch_reqn_link: { desc: @purch_reqn_link.desc, from_purch_reqn_id: @purch_reqn_link.from_purch_reqn_id, purch_reqn_link_type_id: @purch_reqn_link.purch_reqn_link_type_id, to_purch_reqn_id: @purch_reqn_link.to_purch_reqn_id } }
    assert_redirected_to purch_reqn_link_url(@purch_reqn_link)
  end

  test "should destroy purch_reqn_link" do
    assert_difference("PurchReqnLink.count", -1) do
      delete purch_reqn_link_url(@purch_reqn_link)
    end

    assert_redirected_to purch_reqn_links_url
  end
end
