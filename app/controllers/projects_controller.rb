# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.new(name: 'MyName', description: 'MyDescription')
  end
end
