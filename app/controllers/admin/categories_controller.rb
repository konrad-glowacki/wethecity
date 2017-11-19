# frozen_string_literal: true

module Admin
  class CategoriesController < Admin::ApplicationController
    include AdministrateHelpers

    def find_resource(param)
      Category.friendly.find(param)
    end

    def resource_params
      delete_empty_param(super, [:ancestry])
    end
  end
end
