class PostPolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    user.try(:admin?)
  end

  def edit?
    update?
  end

  def update?
    user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end

end