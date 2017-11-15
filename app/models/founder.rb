# frozen_string_literal: true

class Founder < ActiveRecord::Base
  belongs_to :member, polymorphic: true
  belongs_to :project

  enum role: %i[leader ambassador partner]

  validates :role, presence: true
end
