# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SuperAdmin, type: :model do
  it 'initialize' do
    admin = described_class.new
    expect(admin.save).to be_falsy
  end
end
