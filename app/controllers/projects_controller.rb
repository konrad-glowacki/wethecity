# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.active.order(sort_order: :asc).limit(20).decorate
  end

  def search
    @projects = Project.search(params[:q]).decorate
    render :index
  end

  def show
    @project = Project.friendly.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    render plain: params[:article].inspect
  end
end
