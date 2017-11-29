class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?

  end

  def create?
    true
  end

  def index?
    true
  end
end
