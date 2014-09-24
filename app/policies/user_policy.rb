class UserPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user
  end
end