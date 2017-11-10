# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'websites json' do
    websites = { home: 'some-home.com', additional: 'some-additional.com' }

    account = Organisation.new(
      websites: websites, name: 'test', address: 'some address 11', email: 'official@email.com'
    )

    assert account.save
    assert_equal account.websites['home'], websites[:home]
    assert_equal account.websites['additional'], websites[:additional]
  end

  # test 'Account can have multiple Projects' do
  #   account = accounts(:fundation)
  #   project1 = projects(:project1)
  #   project2 = projects(:two)
  #   account.projects << project1 << project2

  #   assert_equal account.projects.count, 2
  # end

  # test 'Account can have more Projects but not related to the same Project' do
  #   account = accounts(:fundation)
  #   project1 = projects(:project1)
  #   project2 = projects(:two)
  #   account.projects << project1 << project2

  #   error = assert_raises(ActiveRecord::RecordNotUnique) { account.projects << project1 }
  #   assert_match(/PG::UniqueViolation/, error.message)
  # end
end
