class RefactorDescToDescriptionOnCommodityListTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :commodity_lists, :desc, :description
  end
end
