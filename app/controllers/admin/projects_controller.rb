# frozen_string_literal: true

module Admin
  class ProjectsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Project.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Project.find_by!(id: param)
    # end

    def resource_params
      permitted_attributes = dashboard.permitted_attributes + [{ account_ids: [] }]
      custom_params = params.require(:project).permit(permitted_attributes)
      custom_params[:account_ids].delete('') if custom_params[:account_ids].size > 1
      custom_params
    end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
