# frozen_string_literal: true

class Account < ApplicationRecord
  extend FriendlyId

  # Soft Delete
  acts_as_paranoid

  # Friendly Url's
  friendly_id :name, use: :slugged

  # Images
  mount_uploader :logo, LogoUploader

  # Relations
  has_many :founders, as: :member
  has_many :engagements, as: :provider
  has_many :projects, through: :founders
  has_and_belongs_to_many :users
  has_and_belongs_to_many :resources

  # Validations
  validates :name, presence: true
  validates :type, presence: true
  validates :address, presence: true
  validates :email, presence: true

  # Class methods
  def self.types
    %w[AdministrationOffice Company Organisation]
  end
end
