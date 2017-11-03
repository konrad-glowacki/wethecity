# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < ApplicationController
    def facebook
      @user = User.from_facebook(request.env['omniauth.auth'])
      sign_in_and_redirect @user
    end

    def failure
      flash.alert = params[:error_message]
      redirect_to new_user_session_path
    end
  end
end
