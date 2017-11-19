# frozen_string_literal: true

class Account < ApplicationRecord
  extend FriendlyId

  acts_as_paranoid
  friendly_id :name, use: :slugged
  mount_uploader :avatar, AvatarUploader

  has_and_belongs_to_many :users
  has_many :resources, as: :provider
  has_many :engagements, as: :provider
  has_many :founders, as: :member
  has_many :projects, through: :founders

  validates :name, presence: true
  validates :type, presence: true
  validates :address, presence: true
  validates :email, presence: true

  def self.types
    %w[AdministrationOffice Company Organisation]
  end
end
