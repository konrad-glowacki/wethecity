# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  fixtures :categories, :projects

  it 'test_has_ancestry_get_parent_class' do
    category_parent = categories(:parent)
    category_child = described_class.find(categories(:children).id)
    category_child.update!(parent: category_parent)

    expect(category_parent).to eq(category_child.parent)
    expect(category_parent.children.first).to eq(category_child)
  end

  it 'test_relation_with_project' do
    category = categories(:events)
    project = projects(:project1)
    category.projects.push(project)

    expect(category.projects.first).to eq(project)
  end
end
