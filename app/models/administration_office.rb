# frozen_string_literal: true

class AdministrationOffice < Account
  extend FriendlyId
  friendly_id :name, use: :slugged
end
