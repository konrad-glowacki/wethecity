# frozen_string_literal: true

module Admin
  class AccountsController < Admin::ApplicationController
    def find_resource(param)
      Account.friendly.find(param)
    end
  end
end
