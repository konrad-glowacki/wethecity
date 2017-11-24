# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name 'Project name'
    active true
    video_url 'MyString'
    description 'MyText'
    finish_on { Date.today + 30.days }
    location 'MyString'
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    city { Faker::Address.city }
    required_budget { Faker::Number.decimal(2) }
    collected_budget { Faker::Number.decimal(2) }
  end
end
