class PurchOrderPolicy < ApplicationPolicy
  def index?
    user.is_superuser? || user.has_role?('Buyer') || user.has_role?('Purchase Order')
  end

  def show?
    user.is_superuser? || user.has_role?('Buyer') || user.has_role?('Purchase Order')
  end

  def create?
    user.is_superuser? || user.has_role?('Buyer') || user.has_role?('Purchase Order')
  end

  def update?
    user.is_superuser? || user.has_role?('Buyer') || user.has_role?('Purchase Order')
  end

  def index?
    user.is_superuser? || user.has_role?('Buyer') || user.has_role?('Purchase Order')
  end

  def edit?
    user.is_superuser? || user.has_role?('Buyer') || user.has_role?('Purchase Order')
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
