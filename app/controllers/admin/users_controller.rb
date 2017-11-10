# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def resource_params
      custom_params = params.require(resource_class.model_name.param_key)
                            .permit(dashboard.permitted_attributes)

      custom_params.delete(:password) if custom_params[:password].empty?
      custom_params
    end
  end
end
