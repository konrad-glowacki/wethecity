# frozen_string_literal: true

module Admin
  class CategoriesController < Admin::ApplicationController
    include AdministrateHelpers

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Category.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Category.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def resource_params
      delete_empty_param(super, [:ancestry])
    end
  end
end
