# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Founder, type: :model do
  it { should belong_to(:member) }

  it { is_expected.to have_db_column(:member_id).of_type(:integer) }
  it { is_expected.to have_db_column(:member_type).of_type(:string) }
end
