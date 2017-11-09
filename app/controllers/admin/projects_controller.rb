# frozen_string_literal: true

module Admin
  class ProjectsController < Admin::ApplicationController
    before_action :set_project, only: [:edit, :destroy]
    
    def create
      @project = Project.new(resource_params)
      if @project.save
        flash[:success] = "Project successfully added"
        redirect_back(fallback_location: admin_projects_path)
      else
        flash[:notice] = "Something went wrong"
        redirect_back(fallback_location: admin_projects_path)
      end
    end

    def edit
      if @project.update_attributes(resource_params)
        redirect_back(fallback_location: admin_projects_path)
        flash[:success] = "Project successfully updated"
      else
        redirect_to @project
        flash[:notice] = "Something went wrong"
      end
    end

    def destroy
      @project.destroy
      redirect_back(fallback_location: admin_projects_path)
      flash[:notice] = "Project deleted"
    end

    def set_project
      @project = Project.find(params[:id])
    end

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
