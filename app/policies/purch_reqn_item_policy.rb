class PurchReqnItemPolicy < ApplicationPolicy
  def index?
    user.is_superuser? || user.has_role?('Buyer')
  end

  def update?
    user.is_superuser? || user.has_role?('Buyer')
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
