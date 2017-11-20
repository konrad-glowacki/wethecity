# frozen_string_literal: true

shared_examples 'member' do
  it { is_expected.to have_many(:founders) }
end
