# frozen_string_literal: true

class Project < ApplicationRecord
  acts_as_paranoid
  mount_uploaders :images, ImageUploader
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :categories
  has_many :founders
  has_many :members, through: :founders
  has_many :engagements
  has_many :resources, through: :engagements

  geocoded_by :location
  after_validation :geocode

  validates :name, presence: true
  validates :description, presence: true
  validates :finish_on, presence: true
  validates :location, presence: true
end
