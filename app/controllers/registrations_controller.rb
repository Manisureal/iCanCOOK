class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :verify_signed_out_user, only: :destroy

  def sign_up_params

    params.require(:user).permit(:first_name, :surname, :email, :password, :password_confirmation, :photo)

  end

  def account_update_params
    params.require(:user).permit(:first_name, :surname, :email, :password, :password_confirmation, :current_password, :photo)
  end

  private

  def after_update_path_for(resource)
    dashboard_path
  end

end
