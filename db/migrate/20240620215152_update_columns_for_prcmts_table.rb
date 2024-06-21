class UpdateColumnsForPrcmtsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :prcmts, :classes, :string
    add_column :prcmts, :warranty, :string
    add_column :prcmts, :location, :string
    add_column :prcmts, :status, :string, default: 'ACTIVE'
    add_column :prcmts, :hsse_risk, :string
  end
end
