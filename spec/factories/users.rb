# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    email { Faker::Internet.email }
    password 'mypasssword'
    confirmed_at Time.now
  end
end
