# frozen_string_literal: true

class Account < ApplicationRecord
  acts_as_paranoid

  has_many :resources, as: :provider
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :users
end
