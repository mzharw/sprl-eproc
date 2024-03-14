class AddNullableToCurrenctiesPurchGroupsUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :currencies, :created_at, true
    change_column_null :currencies, :updated_at, true

    change_column_null :purch_groups, :created_at, true
    change_column_null :purch_groups, :updated_at, true

    change_column_null :users, :created_at, true
    change_column_null :users, :updated_at, true
  end
end
