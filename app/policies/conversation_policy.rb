class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where("sender_id = ? OR recipient_id = ?", user.id, user.id)
    end
  end

  def create?
    true
  end

  def index?
    true
  end
end
