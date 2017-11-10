# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  fixtures :categories, :projects

  it 'test_relation_with_category' do
    category = categories(:events)
    project = projects(:project1)
    project.categories.push(category)

    expect(project.categories.first).to eq(category)
  end
end
