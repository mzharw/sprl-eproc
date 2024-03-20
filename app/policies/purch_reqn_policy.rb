class PurchReqnPolicy < ApplicationPolicy

  def index?
    (user.is_superuser? || user.has_any_role?('Buyer', 'General User', 'User')) || user.has_role?('Purchase Requisition')
  end

  def create?
    (user.is_superuser? || user.has_role?('Buyer', 'User')) && user.has_role?('Purchase Requisition')
  end

  def update?
    (user.is_superuser? || user.has_role?('Buyer', 'User')) && user.has_role?('Purchase Requisition')
  end

  def show?
    (user.is_superuser? || user.has_role?('Buyer', 'General User', 'User')) || user.has_role?('Purchase Requisition')
  end

  def edit?
    (user.is_superuser? || user.has_role?('Buyer', 'User')) && user.has_role?('Purchase Requisition')
  end

  def carry_out?
    (user.is_superuser? || user.has_role?('Buyer')) && user.has_role?('Purchase Requisition')
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
