class AddPartyIdUserTypeIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :party_id, :uuid
    add_column :users, :user_type_id, :uuid
    add_index :users, :party_id
    add_index :users, :user_type_id
  end
end
