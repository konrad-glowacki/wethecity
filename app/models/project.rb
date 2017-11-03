# frozen_string_literal: true

class Project < ApplicationRecord
  acts_as_paranoid

  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :users

  geocoded_by :location
  after_validation :geocode
end
