# frozen_string_literal: true

class Project < ApplicationRecord
  extend FriendlyId

  acts_as_paranoid
  friendly_id :name, use: :slugged
  mount_uploaders :images, ImageUploader

  geocoded_by :location
  after_validation :geocode

  has_and_belongs_to_many :categories
  has_many :founders
  has_many :members, through: :founders
  has_many :engagements
  has_many :resources, through: :engagements

  validates :name, presence: true
  validates :description, presence: true
  validates :finish_on, presence: true
  validates :location, presence: true
  validates :sort_order, numericality: { greater_than: 0, allow_nil: true }

  def self.search(q)
    q.present? ? where('name ILIKE ?', "%#{q}%") : order(sort_order: :asc).limit(20)
  end
end
