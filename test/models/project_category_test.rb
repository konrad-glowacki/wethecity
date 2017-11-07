# frozen_string_literal: true

require 'test_helper'

class ProjectCategoryChild < ProjectCategory
end

class ProjectCategoryTest < ActiveSupport::TestCase
  def test_has_ancestry_get_parent_class
    # Create object of the base class ProjectCategory
    project_category = ProjectCategory.new

    # Create object which derives from ProjectCategory
    project_category_child = ProjectCategoryChild.new

    # Check if child object has ancestry
    exp = project_category_child.parent.class.name
    act = project_category.class.name
    assert_equal exp, act
  end
end
