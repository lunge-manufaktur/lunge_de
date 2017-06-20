class ProductPolicy < ApplicationPolicy
  attr_reader :user, :record
  
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user&.admin?
        scope.all
      else
        scope.where(is_published: true)
      end
    end
  end

  def changed_since?
    index?
  end

  def stock_changed_since?
    index?
  end

  def show?
    user || record.is_published
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

  def updat?
    user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end
end