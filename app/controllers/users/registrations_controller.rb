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
  end
end
