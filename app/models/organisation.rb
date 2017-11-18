# frozen_string_literal: true

class Organisation < Account
  extend FriendlyId
  friendly_id :name, use: :slugged
end
