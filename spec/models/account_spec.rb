# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  fixtures :accounts

  it 'websites json' do
    websites = { home: 'some-home.com', additional: 'some-additional.com' }

    account = Organisation.new(
      websites: websites, name: 'test', address: 'some address 11', email: 'official@email.com'
    )

    expect(account.save).to be_truthy
    expect(account.websites['home']).to eq(websites[:home])
    expect(account.websites['additional']).to eq(websites[:additional])
  end
end
