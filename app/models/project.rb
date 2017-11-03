# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :users

  geocoded_by :location
  after_validation :geocode

  validates :name, presence: true
  validates :active, presence: true, inclusion: { in: [true, false] }
  validates :description_html, presence: true
  validates :finish_on, presence: true
  validates :location, presence: true
end
