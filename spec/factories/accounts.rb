# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name 'Default Account name'
    type { Organisation }
    facebook_website { Faker::Internet.url('facebook.com') }
    homepage_website { Faker::Internet.url }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end

  factory :organization, class: Account do
    name 'Organization name'
    type { Organisation }
    facebook_website { Faker::Internet.url('facebook.com') }
    homepage_website { Faker::Internet.url }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end

  factory :company, class: Account do
    name 'Company name'
    type { Company }
    facebook_website { Faker::Internet.url('facebook.com') }
    homepage_website { Faker::Internet.url }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end

  factory :admininstration_office, class: Account do
    name 'Administration Office name'
    type { AdministrationOffice }
    facebook_website { Faker::Internet.url('facebook.com') }
    homepage_website { Faker::Internet.url }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end
end
