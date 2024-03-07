class AddPartyToVendors < ActiveRecord::Migration[7.1]
  def change
    add_column :vendors, :party_id, :uuid
  end
end
