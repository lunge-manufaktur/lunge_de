class PostPolicy < ApplicationPolicy

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end

end