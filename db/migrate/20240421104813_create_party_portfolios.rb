class CreatePartyPortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :party_portfolios, id: :uuid do |t|
      t.uuid :party_id
      t.uuid :scope_of_supply_id
      t.string :name
      t.date :from_date
      t.date :thru_date
      t.text :testimony
      t.uuid :testimony_doc_id
      t.string :project_owner
      t.string :project_number
      t.string :project_location
      t.uuid :currency_id
      t.decimal :project_value
      t.string :project_handover_letter_number
      t.uuid :project_handover_letter_doc_id
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
