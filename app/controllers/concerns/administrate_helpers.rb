# frozen_string_literal: true

module AdministrateHelpers
  extend ActiveSupport::Concern

  private

  def delete_empty_param(params, keys)
    keys.each { |k| params.delete(k) if params[k].empty? }
    params
  end
end
