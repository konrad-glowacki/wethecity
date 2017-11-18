# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      respond_to do |format|
        format.js
      end
    end
  end
end
