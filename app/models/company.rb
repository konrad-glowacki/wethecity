# frozen_string_literal: true

class Company < Account
  extend FriendlyId
  friendly_id :name, use: :slugged
end
