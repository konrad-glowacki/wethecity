# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :users

  geocoded_by :latitude, :longitude
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
