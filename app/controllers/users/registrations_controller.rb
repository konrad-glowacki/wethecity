# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :js

    def create
      super(&:skip_confirmation!)
    end

    protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    private

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :volunteer, resources_attributes: %i[name kind _destroy])
    end
  end
end
