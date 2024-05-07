class CreateLegalOrgCredTypeCatClassns < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_org_cred_type_cat_classns, id: :uuid do |t|
      t.uuid :legal_org_cred_type_id
      t.uuid :legal_org_cred_type_cat_id
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
