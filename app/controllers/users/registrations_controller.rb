# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :js

    def init
      @user = build_resource(sign_up_params)
      session[:user][:password] = @user.password
      session[:user][:password_confirmation] = @user.password_confirmation
      session[:user][:email] = @user.email
    end

    private

    def sign_up_params
      params[:user][:password] = session[:user]["password"]
      params[:user][:password_confirmation] = session[:user]["password_confirmation"]
      params[:user][:email] = session[:user]["email"]
      params.require(:user).permit(:first_name, :last_name, :email, :volunteer, :password, :password_confirmation)
    end
  end
end
