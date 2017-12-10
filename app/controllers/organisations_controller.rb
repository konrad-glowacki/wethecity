# frozen_string_literal: true

class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[show edit update]

  def show; end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      redirect_to @organisation, notice: 'Oraganisation was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @organisation.update(organisation_params)
      redirect_to @organisation, notice: 'Oraganisation was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_organisation
    @organisation = Organisation.friendly.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(organisation_attr)
  end

  def organisation_attr
    %i[name address logo logo_cache type description website_url facebook_url linkedin_url email phone_number]
  end
end
