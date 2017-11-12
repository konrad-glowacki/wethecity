# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  fixtures :projects, :accounts

  it 'Account can have multiple Projects' do
    account = accounts(:fundation)
    project1 = projects(:project1)
    project2 = projects(:project2)
    account.projects << project1 << project2

    expect(account.projects.count).to eq(2)
  end

  it 'Account can have more Projects but not related to the same Project' do
    account = accounts(:fundation)
    project1 = projects(:project1)
    project2 = projects(:project2)
    account.projects << project1 << project2

    expect { account.projects << project1 }.to raise_error(ActiveRecord::RecordNotUnique, /PG::UniqueViolation/)
  end
end
