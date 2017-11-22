# frozen_string_literal: true

class Resource < ApplicationRecord
  # Soft Delete
  acts_as_paranoid

  # Data
  enum kind: %i[skill asset]

  # Relations
  has_many :engagements
  has_many :projects, through: :engagements
  has_and_belongs_to_many :users
  has_and_belongs_to_many :accounts

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :kind, presence: true
end
