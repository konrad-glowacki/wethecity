# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'initialize' do
    user = User.new
    assert_not user.save
  end

  test 'User can have one Account' do
    user = users(:user1)
    account = accounts(:fundation)
    user.accounts << account

    assert_equal user.accounts.last, account
  end

  test 'User can have more Accounts' do
    user = users(:user1)
    account1 = accounts(:fundation)
    account2 = accounts(:krakow_city)
    user.accounts << account1 << account2

    assert_equal user.accounts.count, 2
  end

  test 'User can have more Accounts but not related to the same Account' do
    user = users(:user1)
    account1 = accounts(:fundation)
    account2 = accounts(:krakow_city)
    user.accounts << account1 << account2

    error = assert_raises(ActiveRecord::RecordNotUnique) { user.accounts << account1 }
    assert_match(/PG::UniqueViolation/, error.message)
  end
end
