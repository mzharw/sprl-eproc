require "test_helper"

class ContractReferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_reference = contract_references(:one)
  end

  test "should get index" do
    get contract_references_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_reference_url
    assert_response :success
  end

  test "should create contract_reference" do
    assert_difference("ContractReference.count") do
      post contract_references_url, params: { contract_reference: { app_id: @contract_reference.app_id, area_code: @contract_reference.area_code, contact_type_id: @contract_reference.contact_type_id, country_id: @contract_reference.country_id, created_at: @contract_reference.created_at, created_by: @contract_reference.created_by, district_id: @contract_reference.district_id, electronic_address: @contract_reference.electronic_address, ext: @contract_reference.ext, number: @contract_reference.number, other_country: @contract_reference.other_country, other_district: @contract_reference.other_district, other_province: @contract_reference.other_province, other_sub_district: @contract_reference.other_sub_district, other_village: @contract_reference.other_village, postal_address: @contract_reference.postal_address, postal_code: @contract_reference.postal_code, province_id: @contract_reference.province_id, sub_district_id: @contract_reference.sub_district_id, updated_at: @contract_reference.updated_at, updated_by: @contract_reference.updated_by, village_id: @contract_reference.village_id } }
    end

    assert_redirected_to contract_reference_url(ContractReference.last)
  end

  test "should show contract_reference" do
    get contract_reference_url(@contract_reference)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_reference_url(@contract_reference)
    assert_response :success
  end

  test "should update contract_reference" do
    patch contract_reference_url(@contract_reference), params: { contract_reference: { app_id: @contract_reference.app_id, area_code: @contract_reference.area_code, contact_type_id: @contract_reference.contact_type_id, country_id: @contract_reference.country_id, created_at: @contract_reference.created_at, created_by: @contract_reference.created_by, district_id: @contract_reference.district_id, electronic_address: @contract_reference.electronic_address, ext: @contract_reference.ext, number: @contract_reference.number, other_country: @contract_reference.other_country, other_district: @contract_reference.other_district, other_province: @contract_reference.other_province, other_sub_district: @contract_reference.other_sub_district, other_village: @contract_reference.other_village, postal_address: @contract_reference.postal_address, postal_code: @contract_reference.postal_code, province_id: @contract_reference.province_id, sub_district_id: @contract_reference.sub_district_id, updated_at: @contract_reference.updated_at, updated_by: @contract_reference.updated_by, village_id: @contract_reference.village_id } }
    assert_redirected_to contract_reference_url(@contract_reference)
  end

  test "should destroy contract_reference" do
    assert_difference("ContractReference.count", -1) do
      delete contract_reference_url(@contract_reference)
    end

    assert_redirected_to contract_references_url
  end
end
