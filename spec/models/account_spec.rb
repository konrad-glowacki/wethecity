# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'Account can have multiple Projects' do
    account = build(:account)
    project1 = build(:project)
    project2 = build(:project)

    Founder.create!(project: project1, role: 'leader', member: account)
    Founder.create!(project: project2, role: 'leader', member: account)

    expect(account.projects.count).to eq(2)
  end
end
