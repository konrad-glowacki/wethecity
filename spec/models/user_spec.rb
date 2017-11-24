# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'initialize' do
    user = described_class.new
    expect(user.save).to be_falsy
  end

  it 'User can have one Account' do
    user = build(:user)
    account = build_stubbed(:account)
    user.accounts << account

    expect(user.accounts.last).to eql(account)
  end

  it 'User can have more Accounts' do
    user = build_stubbed(:user)
    account1 = build(:account)
    account2 = build(:admininstration_office)
    user.accounts << account1 << account2

    expect(user.accounts.count).to eq(2)
  end

  it 'User can have more Accounts but not related to the same Account' do
    user = build_stubbed(:user)
    account1 = build_stubbed(:account)
    account2 = build_stubbed(:admininstration_office)
    user.accounts << account1 << account2

    expect { user.accounts << account1 }.to raise_error(ActiveRecord::RecordNotUnique, /PG::UniqueViolation/)
  end
end
