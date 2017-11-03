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
end
