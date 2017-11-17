# frozen_string_literal: true

module Admin
  class ProjectsController < Admin::ApplicationController
    before_action :set_default_params

    def find_resource(param)
      Project.friendly.find(param)
    end

    private

    def set_default_params
      params[:order] ||= 'sort_order'
      params[:direction] ||= 'asc'
    end
  end
end
