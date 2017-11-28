class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :verify_signed_out_user, only: :destroy

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache)
  end
end
