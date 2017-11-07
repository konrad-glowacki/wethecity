# frozen_string_literal: true

class Account < ApplicationRecord
  acts_as_paranoid

  mount_uploader :avatar, AvatarUploader

  has_many :resources, as: :provider
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :type, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
