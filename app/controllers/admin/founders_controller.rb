# frozen_string_literal: true

module Admin
  class FoundersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Account.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Account.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def resource_params
      permitted_attributes = dashboard.permitted_attributes
      custom_params = params.require(:founder).permit(permitted_attributes)
      custom_params
    end
  end
end
