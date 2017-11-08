# frozen_string_literal: true

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def test_relation_with_category
    category = categories(:events)
    project = projects(:project1)
    project.categories.push(category)

    assert_equal project.categories.first, category
  end
end
