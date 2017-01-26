class PostPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
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

  def update?
    user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end

end