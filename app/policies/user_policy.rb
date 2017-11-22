class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def dashboard?
    record == user
  end

  def edit?
    record == user
  end

  def show?
    record == user
  end

end
