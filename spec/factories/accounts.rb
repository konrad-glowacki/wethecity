# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name 'Default Account name'
    type { Organisation }
    facebook_url { Faker::Internet.url('facebook.com') }
    website_url { Faker::Internet.url }
    linkedin_url { Faker::Internet.url('linkedin.com') }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    description { Faker::Hobbit.quote }
  end

  factory :organization, class: Account do
    name 'Organization name'
    type { Organisation }
    facebook_url { Faker::Internet.url('facebook.com') }
    website_url { Faker::Internet.url }
    linkedin_url { Faker::Internet.url('linkedin.com') }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    description { Faker::Hobbit.quote }
  end

  factory :company, class: Account do
    name 'Company name'
    type { Company }
    facebook_url { Faker::Internet.url('facebook.com') }
    website_url { Faker::Internet.url }
    linkedin_url { Faker::Internet.url('linkedin.com') }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    description { Faker::Hobbit.quote }
  end

  factory :admininstration_office, class: Account do
    name 'Administration Office name'
    type { AdministrationOffice }
    facebook_url { Faker::Internet.url('facebook.com') }
    website_url { Faker::Internet.url }
    linkedin_url { Faker::Internet.url('linkedin.com') }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    description { Faker::Hobbit.quote }
  end
end
