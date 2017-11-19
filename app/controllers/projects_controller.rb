# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.filtered_records(params[:q]).order(sort_order: :asc)
  end

  def show
    @project = Project.friendly.find(params[:id])
  end
end
