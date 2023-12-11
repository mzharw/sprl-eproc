class CreateCommodityLists < ActiveRecord::Migration[7.1]
  def change
    create_table :commodity_lists, id: :uuid do |t|
      t.uuid :commodity_list_id
      t.string :number
      t.string :desc
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
