class CreateLegalOrgCredTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_org_cred_types, id: :uuid do |t|
      t.string :ident_name
      t.string :name
      t.text :desc
      t.boolean :system
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
