require "application_system_test_case"

class ContractReferencesTest < ApplicationSystemTestCase
  setup do
    @contract_reference = contract_references(:one)
  end

  test "visiting the index" do
    visit contract_references_url
    assert_selector "h1", text: "Contract references"
  end

  test "should create contract reference" do
    visit contract_references_url
    click_on "New contract reference"

    fill_in "Area code", with: @contract_reference.area_code
    fill_in "Contact type", with: @contract_reference.contact_type_id
    fill_in "Country", with: @contract_reference.country_id
    fill_in "Created at", with: @contract_reference.created_at
    fill_in "Created by", with: @contract_reference.created_by_id
    fill_in "District", with: @contract_reference.district_id
    fill_in "Electronic address", with: @contract_reference.electronic_address
    fill_in "Ext", with: @contract_reference.ext
    fill_in "Number", with: @contract_reference.number
    fill_in "Other country", with: @contract_reference.other_country
    fill_in "Other district", with: @contract_reference.other_district
    fill_in "Other province", with: @contract_reference.other_province
    fill_in "Other sub district", with: @contract_reference.other_sub_district
    fill_in "Other village", with: @contract_reference.other_village
    fill_in "Postal address", with: @contract_reference.postal_address
    fill_in "Postal code", with: @contract_reference.postal_code
    fill_in "Province", with: @contract_reference.province_id
    fill_in "Sub district", with: @contract_reference.sub_district_id
    fill_in "Updated at", with: @contract_reference.updated_at
    fill_in "Updated by", with: @contract_reference.updated_by_id
    fill_in "Village", with: @contract_reference.village_id
    click_on "Create Contract reference"

    assert_text "Contract reference was successfully created"
    click_on "Back"
  end

  test "should update Contract reference" do
    visit contract_reference_url(@contract_reference)
    click_on "Edit this contract reference", match: :first

    fill_in "Area code", with: @contract_reference.area_code
    fill_in "Contact type", with: @contract_reference.contact_type_id
    fill_in "Country", with: @contract_reference.country_id
    fill_in "Created at", with: @contract_reference.created_at
    fill_in "Created by", with: @contract_reference.created_by_id
    fill_in "District", with: @contract_reference.district_id
    fill_in "Electronic address", with: @contract_reference.electronic_address
    fill_in "Ext", with: @contract_reference.ext
    fill_in "Number", with: @contract_reference.number
    fill_in "Other country", with: @contract_reference.other_country
    fill_in "Other district", with: @contract_reference.other_district
    fill_in "Other province", with: @contract_reference.other_province
    fill_in "Other sub district", with: @contract_reference.other_sub_district
    fill_in "Other village", with: @contract_reference.other_village
    fill_in "Postal address", with: @contract_reference.postal_address
    fill_in "Postal code", with: @contract_reference.postal_code
    fill_in "Province", with: @contract_reference.province_id
    fill_in "Sub district", with: @contract_reference.sub_district_id
    fill_in "Updated at", with: @contract_reference.updated_at
    fill_in "Updated by", with: @contract_reference.updated_by_id
    fill_in "Village", with: @contract_reference.village_id
    click_on "Update Contract reference"

    assert_text "Contract reference was successfully updated"
    click_on "Back"
  end

  test "should destroy Contract reference" do
    visit contract_reference_url(@contract_reference)
    click_on "Destroy this contract reference", match: :first

    assert_text "Contract reference was successfully destroyed"
  end
end
