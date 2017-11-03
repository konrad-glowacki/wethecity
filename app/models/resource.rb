# frozen_string_literal: true

class Resource < ApplicationRecord
  enum kind: %i[skill asset]

  belongs_to :provider, polymorphic: true

  validates :name, presence: true
  validates :kind, presence: true
end
