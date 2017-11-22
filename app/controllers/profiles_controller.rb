class ProfilesController < ApplicationController
  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
  end
end
