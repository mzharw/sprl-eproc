class User < ApplicationRecord
  rolify before_add: :before_add_method
  belongs_to :party, optional: true
  has_one :personnel, through: :party

  validates :password, confirmation: true,
            unless: Proc.new { |a| a.password.blank? }

  def before_add_method(role) end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
