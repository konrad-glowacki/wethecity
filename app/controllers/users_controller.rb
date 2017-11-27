# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id]).decorate
    @created_projects = @user.projects.decorate
    @supported_projects = @user.engagements_with_project_and_resource
  end
end
