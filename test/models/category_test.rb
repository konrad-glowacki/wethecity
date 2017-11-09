# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def test_has_ancestry_get_parent_class
    category_parent = categories(:parent)
    category_child = Category.find(categories(:children).id)
    category_child.update!(parent: category_parent)

    assert_equal category_parent, category_child.parent
    assert_equal category_parent.children.first, category_child
  end

  def test_relation_with_project
    category = categories(:events)
    project = projects(:project1)
    category.projects.push(project)

    assert_equal category.projects.first, project
  end
end
