# frozen_string_literal: true

require 'test_helper'

class SuperAdminTest < ActiveSupport::TestCase
  test 'initialize' do
    admin = SuperAdmin.new
    assert_not admin.save
  end
end
