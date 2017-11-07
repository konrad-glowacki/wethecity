# frozen_string_literal: true

require 'test_helper'

class ProjectCategoryChild < ProjectCategory
  def ancestry
    super
  end
end

class ProjectCategoryTest < ActiveSupport::TestCase
  # Create object which derives from ProjectCategory
  project_category_child = ProjectCategoryChild.new

  # Check if child object has ancestry
  expected = project_category_child.has_ancestry
  assert_equal(expected)
end
