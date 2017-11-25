# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :js

    def create
      super
      return unless resource.errors.empty?
      resource.skip_confirmation!
      sign_in resource
    end

    protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :volunteer, :password, :password_confirmation)
    end
  end
end
