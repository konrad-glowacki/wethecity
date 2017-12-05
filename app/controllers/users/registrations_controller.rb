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
      resources_attr = %i[name kind _destroy]
      user_attr = %i[first_name last_name volunteer biography]
      params.require(:user).permit(user_attr, resources_attributes: resources_attr)
    end
  end
end
