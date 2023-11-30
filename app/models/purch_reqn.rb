class PurchReqn < ApplicationRecord
  belongs_to :created_by
  belongs_to :updated_by
  belongs_to :purch_org
  belongs_to :purch_group
  belongs_to :plant
  belongs_to :cost_center
  belongs_to :currency
  belongs_to :recreate_from
  belongs_to :contract_reference
  belongs_to :prcmt
end
