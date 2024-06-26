class User < ApplicationRecord
  rolify before_add: :before_add_method
  belongs_to :party, optional: true
  has_one :personnel, through: :party
  has_one :buyer, through: :party
  has_many :buyer_purch_groups, through: :buyer
  has_many :buyer_plants, through: :buyer

  scope :active, -> { where(state: 'ACTIVE') }

  validates :password, confirmation: true,
            unless: Proc.new { |a| a.password.blank? }

  validates :username, uniqueness: true, presence: true

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def before_add_method(role) end

  def purch_group_ids
    buyer_purch_groups.pluck(:purch_group_id)
  end

  def plant_ids
    buyer_plants.pluck(:plant_id)
  end

  def is_superuser?
    has_any_role? 'Super Admin', 'General Manager'
  end

  def is_finance_manager?
    has_role? 'Manager of Finance'
  end

  def is_scm_manager?
    has_role? 'Manager SCM'
  end

  def is_superadmin?
    has_role? 'Super Admin'
  end

  def is_buyer?
    has_role? 'Buyer'
  end

  def is_hse?
    has_role? 'Head of HSE'
  end

  def self.find_for_authentication(warden)
    active.find_by(username: warden[:username])
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
