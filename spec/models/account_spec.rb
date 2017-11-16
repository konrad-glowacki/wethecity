# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/member_spec'

RSpec.describe Account, type: :model do
  fixtures :accounts, :projects

  it 'Account can have multiple Projects' do
    account = accounts(:fundation)
    project1 = projects(:project1)
    project2 = projects(:project2)

    Founder.create(project: project1,
                   role: 'leader',
                   member_type: Account,
                   member_id: account.id)

    Founder.create(project: project2,
                   role: 'leader',
                   member_type: Account,
                   member_id: account.id)

    expect(account.projects.count).to eq(2)
  end
end
