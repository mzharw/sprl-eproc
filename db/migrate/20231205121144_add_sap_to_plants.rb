class AddSapToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :sap, :string
  end
end
