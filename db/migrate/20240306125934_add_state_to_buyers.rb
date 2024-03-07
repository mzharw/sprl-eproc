class AddStateToBuyers < ActiveRecord::Migration[7.1]
  def change
    add_column :buyers, :state, :string, default: 'INACTIVE'
  end
end
