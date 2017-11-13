# frozen_string_literal: true

class Founder < ActiveRecord::Base
  belongs_to :member, polymorphic: true

  enum role: %i[leader ambassador]
end
