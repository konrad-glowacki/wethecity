# frozen_string_literal: true

module Admin
  class ProjectsController < Admin::ApplicationController
    def find_resource(param)
      Project.friendly.find(param)
    end
  end
end
