# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :js

    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :volunteer, :password, :password_confirmation)
    end
  end
end
