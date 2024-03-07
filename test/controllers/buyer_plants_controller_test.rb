require "test_helper"

class BuyerPlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer_plant = buyer_plants(:one)
  end

  test "should get index" do
    get buyer_plants_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_plant_url
    assert_response :success
  end

  test "should create buyer_plant" do
    assert_difference("BuyerPlant.count") do
      post buyer_plants_url, params: { buyer_plant: { buyer: @buyer_plant.buyer, created_at: @buyer_plant.created_at, created_by_id: @buyer_plant.created_by_id, from_date: @buyer_plant.from_date, plant: @buyer_plant.plant, thru_date: @buyer_plant.thru_date, updated_at: @buyer_plant.updated_at, updated_by_id: @buyer_plant.updated_by_id } }
    end

    assert_redirected_to buyer_plant_url(BuyerPlant.last)
  end

  test "should show buyer_plant" do
    get buyer_plant_url(@buyer_plant)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_plant_url(@buyer_plant)
    assert_response :success
  end

  test "should update buyer_plant" do
    patch buyer_plant_url(@buyer_plant), params: { buyer_plant: { buyer: @buyer_plant.buyer, created_at: @buyer_plant.created_at, created_by_id: @buyer_plant.created_by_id, from_date: @buyer_plant.from_date, plant: @buyer_plant.plant, thru_date: @buyer_plant.thru_date, updated_at: @buyer_plant.updated_at, updated_by_id: @buyer_plant.updated_by_id } }
    assert_redirected_to buyer_plant_url(@buyer_plant)
  end

  test "should destroy buyer_plant" do
    assert_difference("BuyerPlant.count", -1) do
      delete buyer_plant_url(@buyer_plant)
    end

    assert_redirected_to buyer_plants_url
  end
end
