class ActsAsTaggableOn::TagPolicy < ApplicationPolicy
  def index?
    show?
  end

  def show?
    user.try(:admin?)
  end

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

  def destroy
    user.try(:admin?)
  end
end