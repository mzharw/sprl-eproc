class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  scope :active, -> { where(state: 'ACTIVE') }
  scope :user_role, -> { where(system: false) }

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  validates :name, presence: true

  scopify
end
