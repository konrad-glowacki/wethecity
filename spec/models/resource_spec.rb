# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource, type: :model do
  it 'initialize' do
    resource = described_class.new
    expect(resource.save).to be_falsy
  end
end
