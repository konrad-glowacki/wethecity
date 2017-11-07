# frozen_string_literal: true

require 'test_helper'

class ProjectCategoryTest < ActiveSupport::TestCase
  def test_has_ancestry_get_parent_class
    category_parent = ProjectCategory.create!(name: 'Parent')
    category_child = ProjectCategory.create!(name: 'Children', parent: category_parent)

    assert_equal category_parent, category_child.parent
    assert_equal category_parent.children.first, category_child
  end
end
