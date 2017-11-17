# frozen_string_literal: true

module Admin
  class ProjectsController < Admin::ApplicationController
    before_action :set_default_sort_order

    private

    def set_default_sort_order
      params[:order] ||= 'sort_order'
      params[:direction] ||= 'asc'
    end
  end
end
