# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'test_relation_with_category' do
    project = build_stubbed(:project)
    category = build(:category, name: 'events')
    project.categories.push(category)

    expect(project.categories.first).to eq(category)
  end
end
