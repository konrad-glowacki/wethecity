# frozen_string_literal: true

class ProjectCategory < ActiveRecord::Base
  has_ancestry

  validates :name, presence: true, uniqueness: true
end
