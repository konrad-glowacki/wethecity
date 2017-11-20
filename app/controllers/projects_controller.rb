# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.where(active: true).order(sort_order: :asc).limit(20)
  end

  def search
    @projects = Project.search(params[:q])
    render :index
  end

  def show
    @project = Project.friendly.find(params[:id])
  end
end
