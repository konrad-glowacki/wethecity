# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    include AdministrateHelpers

    def find_resource(param)
      User.friendly.find(param)
    end

    def resource_params
      delete_empty_param(super, [:password])
    end
  end
end
