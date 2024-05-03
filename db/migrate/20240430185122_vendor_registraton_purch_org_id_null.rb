class VendorRegistratonPurchOrgIdNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :vendor_registrations, :purch_org_id, true
  end
end
