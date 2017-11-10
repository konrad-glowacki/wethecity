# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  fixtures :projects, :accounts

  it 'websites json' do
    websites = { home: 'some-home.com', additional: 'some-additional.com' }

    account = Organisation.new(
      websites: websites, name: 'test', address: 'some address 11', email: 'official@email.com'
    )

    expect(account.save).to be_truthy
    expect(account.websites['home']).to eq(websites[:home])
    expect(account.websites['additional']).to eq(websites[:additional])
  end

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
