# frozen_string_literal: true

module Admin
  class ProjectsController < Admin::ApplicationController
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Project.friendly.find(param)
    # end
  end
end
