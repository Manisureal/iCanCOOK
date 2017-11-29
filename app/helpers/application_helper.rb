module ApplicationHelper
  def user?(message, user)
    if message.user == user
      'you'
    else
      'other'
    end
  end
end
