class OrganisationsController < ApplicationController
  def show
  	@organisation = Organisation.friendly.find(params[:id])
  end
end
