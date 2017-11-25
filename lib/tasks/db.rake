# frozen_string_literal: true

require 'urss'
require 'faker'

def rand_array_value(arr)
  arr[(0...arr.size).to_a.sample]
end

def create_categories!(total)
  (1..total).map do
    yield
    Category.create!(name: Faker::Job.unique.field.downcase, description: Faker::Job.title)
  end
end

def create_resources!(total)
  (1..total).map do
    yield
    Resource.create!(name: Faker::Lorem.unique.word, kind: Resource.kinds[Resource.kinds.keys.sample])
  end
end

def create_users!(total)
  (1..total).map do
    yield
    User.create!(
      first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email,
      password: 'test123', biography: Faker::HowIMetYourMother.quote, remote_avatar_url: Faker::Avatar.image,
      confirmed_at: Time.now.utc, phone_number: Faker::PhoneNumber.phone_number,
      facebook_url: Faker::Internet.url('facebook.com'), twitter_url: Faker::Internet.url('twitter.com'),
      google_plus_url: Faker::Internet.url('plus.google.com')
    )
  end
end

def create_accounts!(total)
  (1..total).map do
    yield
    Account.create!(
      name: Faker::Company.name, email: Faker::Internet.email,
      type: rand_array_value(Account.types),
      remote_avatar_url: Faker::Avatar.image, address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      phone_number: Faker::PhoneNumber.phone_number,
      facebook_website: Faker::Internet.url, homepage_website: Faker::Internet.url
    )
  end
end

def generate_description
  result = Faker::Markdown.headers + "\n"
  10.times { result += Faker::Markdown.emphasis + "\n" }
  result
end

def create_projects!(total)
  rss = Urss.at('http://www.flickr.com/services/feeds/photos_public.gne?format=rss_200')
  images_urls = rss.entries.map { |entry| entry.medias.collect(&:content_url) }.flatten

  (1..total).map do |index|
    yield
    Project.create!(
      name: Faker::Commerce.unique.product_name, active: true, video_url: Faker::Internet.url,
      description: generate_description, finish_on: rand(100).days.since,
      location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      required_budget: rand(10_000), collected_budget: rand(1000), sort_order: index,
      remote_images_urls: [images_urls[index - 1]]
    )
  end
end

namespace :db do
  desc 'Creating sample data'
  task load_sample_data: :environment do
    unless Rails.env.development?
      puts 'This task can be run only in development'
      exit
    end

    ActiveRecord::Base.transaction do
      puts 'Create categories'
      categories = create_categories!(20) { print '.' }
      puts ''

      puts 'Create resources'
      resources = create_resources!(50) { print '.' }
      puts ''

      puts 'Create users'
      users = create_users!(50) { print '.' }
      puts ''

      puts 'Assign resources to users'
      users.each do |user|
        print '.'
        (1..5).to_a.sample.times do
          resource = rand_array_value(resources)
          user.resources << resource unless user.resources.include?(resource)
        end

        user.save!
      end
      puts ''

      puts 'Create accounts'
      accounts = create_accounts!(30) { print '.' }
      puts ''

      puts 'Assign accounts to users'
      accounts.each do |account|
        print '.'
        account.users << rand_array_value(users)
        account.save!
      end
      puts ''

      puts 'Assign resources to accounts'
      accounts.each do |account|
        print '.'
        (1..5).to_a.sample.times do
          resource = rand_array_value(resources)
          account.resources << resource unless account.resources.include?(resource)
        end

        account.save!
      end
      puts ''

      puts 'Create projects'
      projects = create_projects!(30) { print '.' }
      puts ''

      puts 'Assign categories to project'
      projects.each do |project|
        print '.'
        project.categories << rand_array_value(categories)
        project.save!
      end
      puts ''

      puts 'Create founders'
      projects.each do |project|
        print '.'
        Founder.create!(project: project, member: rand_array_value(users), role: Founder.roles[:leader])
        print '.'
        Founder.create!(project: project, member: rand_array_value(accounts), role: Founder.roles[:partner])
      end
      puts ''

      puts 'Create engagements'
      users_accounts = users + accounts

      projects.each do |project|
        existing_resource_ids = []

        (1..5).to_a.sample.times do
          print '.'
          resource = rand_array_value(resources)

          next if existing_resource_ids.include?(resource.id)
          Engagement.create!(
            project: project, resource: resource, description: Faker::Hobbit.quote,
            quantity: rand(10), provider: rand_array_value(users_accounts), state: rand_array_value(Engagement.states)
          )

          existing_resource_ids << resource.id
        end
      end
      puts ''
    end

    puts 'Task completed successfully!'
  end
end
