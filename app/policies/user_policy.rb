class UserPolicy < ApplicationPolicy
  def index?
    user.has_role?('Super Admin')
  end

  def create?
    user.has_role?('Super Admin')
  end

  def show?
    true
    # user.has_role?('Super Admin')
  end

  def new?
    user.has_role?('Super Admin')
  end

  def edit?
    user.has_role?('Super Admin')
  end

  def destroy?
    user.has_role?('Super Admin')
  end

  def change_password?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
