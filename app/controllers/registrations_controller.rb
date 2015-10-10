class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permite(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
