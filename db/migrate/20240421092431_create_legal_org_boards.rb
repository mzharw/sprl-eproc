class CreateLegalOrgBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_org_boards, id: :uuid do |t|
      t.uuid :legal_org_id
      t.uuid :legal_org_board_type_id
      t.boolean :is_company_head
      t.string :title
      t.uuid :party_id
      t.date :from_date
      t.date :thru_date
      t.uuid :citizenship_type_id
      t.uuid :signature_sample_id
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
