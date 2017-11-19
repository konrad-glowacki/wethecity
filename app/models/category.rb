# frozen_string_literal: true

class Category < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged
  has_ancestry
  has_and_belongs_to_many :projects

  validates :name, presence: true, uniqueness: true
end
