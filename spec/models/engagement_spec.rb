# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Engagement, type: :model do
  describe 'Engagement' do
    let(:project) { build(:project) }
    let(:resource) { build(:resource) }
    let(:user) { create(:user) }
    let(:account) { create(:account) }

    let(:valid_data_with_user) do
      {
        project: project,
        resource: resource,
        description: 'Testing description',
        quantity: 5,
        provider_type: User,
        provider_id: user.id
      }
    end

    let(:valid_data_with_account) do
      {
        project: project,
        resource: resource,
        description: 'Testing description',
        quantity: 5,
        provider_type: Account,
        provider_id: account.id
      }
    end

    it 'can be created with valid data using User as provider' do
      engagement = Engagement.new(valid_data_with_user)

      expect(engagement.save).to eq(true)
    end

    it 'can not be created with invalid data (no resource)' do
      engagement = Engagement.new(valid_data_with_user)
      engagement.resource = nil

      expect(engagement.save).to eq(false)
      expect(engagement.errors.messages[:resource].first).to eq('must exist')
    end

    it 'can not be created with invalid data (no project)' do
      engagement = Engagement.new(valid_data_with_user)
      engagement.project = nil

      expect(engagement.save).to eq(false)
      expect(engagement.errors.messages[:project].first).to eq('must exist')
    end

    it 'can not be created with invalid data (no user)' do
      engagement = Engagement.new(valid_data_with_user)
      engagement.provider_id = nil

      expect(engagement.save).to eq(false)
      expect(engagement.errors.messages[:provider].first).to eq('must exist')
    end

    it 'can not be created with invalid data (no account)' do
      engagement = Engagement.new(valid_data_with_account)
      engagement.provider_id = nil

      expect(engagement.save).to eq(false)
      expect(engagement.errors.messages[:provider].first).to eq('must exist')
    end

    it 'can not be created twice with the same data' do
      Engagement.create!(valid_data_with_user)

      expect { Engagement.create!(valid_data_with_user) }
        .to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Project has already been taken/)
    end

    it 'can be created with valid data using Account as provider' do
      engagement = Engagement.new(valid_data_with_account)

      expect(engagement.save).to eq(true)
    end
  end
end
