class PrcmtPolicy < ApplicationPolicy

  def index?
    user.is_superuser? || (user.has_role?('Buyer') && user.has_role?('Procurement'))
  end

  def create?
    user.is_superuser? || (user.has_role?('Buyer') && user.has_role?('Procurement'))
  end

  def show?
    user.is_superuser? || (user.has_role?('Buyer') && user.has_role?('Procurement'))
  end


  def update?
    user.is_superuser? || (user.has_role?('Buyer') && user.has_role?('Procurement'))
  end

  def index?
    user.is_superuser? || (user.has_role?('Buyer') && user.has_role?('Procurement'))
  end

  def edit?
    user.is_superuser? || (user.has_role?('Buyer') && user.has_role?('Procurement'))
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
