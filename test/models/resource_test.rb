# frozen_string_literal: true

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  test 'initialize' do
    resource = Resource.new
    assert_not resource.save
  end
end
