# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/member_spec'

RSpec.describe User, type: :model do
  fixtures :users, :accounts
  it_behaves_like 'member'

  it 'initialize' do
    user = described_class.new
    expect(user.save).to be_falsy
  end

  it 'User can have one Account' do
    user = users(:user1)
    account = accounts(:fundation)
    user.accounts << account

    expect(user.accounts.last).to eq(account)
  end

  it 'User can have more Accounts' do
    user = users(:user1)
    account1 = accounts(:fundation)
    account2 = accounts(:krakow_city)
    user.accounts << account1 << account2

    expect(user.accounts.count).to eq(2)
  end

  it 'User can have more Accounts but not related to the same Account' do
    user = users(:user1)
    account1 = accounts(:fundation)
    account2 = accounts(:krakow_city)
    user.accounts << account1 << account2

    expect { user.accounts << account1 }.to raise_error(ActiveRecord::RecordNotUnique, /PG::UniqueViolation/)
  end
end
