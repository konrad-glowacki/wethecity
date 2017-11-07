# frozen_string_literal: true

class ProjectCategory < ActiveRecord::Base
  def ancestry
    has_ancestry
  end
end
