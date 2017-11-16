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
      permitted_attributes = dashboard.permitted_attributes
      custom_params = params.require(:project).permit(permitted_attributes)
      custom_params
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
