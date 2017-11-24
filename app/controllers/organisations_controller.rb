class OrganisationsController < ApplicationController
  def show
    @organisation = Organisation.friendly.find(params[:id])
    @projects = @organisation.projects.decorate
  end
end
