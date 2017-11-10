# frozen_string_literal: true

class Resource < ApplicationRecord
  acts_as_paranoid

  enum kind: %i[skill asset]

  belongs_to :provider, polymorphic: true
  has_many :engagements
  has_many :projects, through: :engagements

  validates :name, presence: true, uniqueness: true
  validates :kind, presence: true
end
