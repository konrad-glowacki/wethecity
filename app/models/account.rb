# frozen_string_literal: true

class Account < ApplicationRecord
  has_and_belongs_to_many :users
end
