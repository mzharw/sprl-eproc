class WorkAcceptanceNotePolicy < ApplicationPolicy
  def index?
    (user.is_superuser? || user.has_role?('Buyer')) && user.has_role?('Work Acceptance Note')
  end

  def create?
    (user.is_superuser? || user.has_role?('Buyer')) && user.has_role?('Work Acceptance Note')
  end

  def update?
    (user.is_superuser? || user.has_role?('Buyer')) && user.has_role?('Work Acceptance Note')
  end

  def show?
    (user.is_superuser? || user.has_role?('Buyer')) && user.has_role?('Work Acceptance Note')
  end

  def edit?
    (user.is_superuser? || user.has_role?('Buyer')) && user.has_role?('Work Acceptance Note')
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
