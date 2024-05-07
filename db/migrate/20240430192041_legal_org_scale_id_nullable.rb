class LegalOrgScaleIdNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :legal_orgs, :legal_org_scale_id, true
  end
end
