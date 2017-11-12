# frozen_string_literal: true

class Engagement < ApplicationRecord
  belongs_to :project
  belongs_to :resource
  belongs_to :provider, polymorphic: true
end
