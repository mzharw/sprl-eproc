class ServicePolicy < ApplicationPolicy
  def index?
    user.has_role?('Super Admin')
  end

  def create?
    user.has_role?('Super Admin')
  end

  def show?
    user.has_role?('Super Admin')
  end

  def new?
    user.has_role?('Super Admin')
  end

  def edit?
    user.has_role?('Super Admin')
  end

  def new_item?
    user.has_role?('Super Admin')
  end

  def edit_item?
    user.has_role?('Super Admin')
  end

  def create_item?
    user.has_role?('Super Admin')
  end

  def update_item?
    user.has_role?('Super Admin')
  end

  def delete_item?
    user.has_role?('Super Admin')
  end

  def update?
    user.has_role?('Super Admin')
  end

  def destroy?
    user.has_role?('Super Admin')
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
