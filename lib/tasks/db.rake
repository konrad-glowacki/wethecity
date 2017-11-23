# frozen_string_literal: true

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
      password: 'test123', biography: Faker::HowIMetYourMother.quote, avatar: Faker::Avatar.image,
      confirmed_at: Time.now.utc
    )
  end
end

def create_accounts!(total)
  (1..total).map do
    yield
    Account.create!(
      name: Faker::Company.name, email: Faker::Internet.email,
      type: rand_array_value(Account.types),
      avatar: Faker::Avatar.image, address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      phone_number: Faker::PhoneNumber.phone_number,
      facebook_website: Faker::Internet.url, homepage_website: Faker::Internet.url
    )
  end
end

def create_projects!(total)
  (1..total).map do |index|
    yield
    Project.create!(
      name: Faker::Lorem.sentence, active: true, video_url: Faker::Internet.url,
      description: Faker::Markdown.headers + Faker::Markdown.emphasis,
      finish_on: rand(100).days.since, location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      required_budget: rand(10_000), collected_budget: rand(1000), sort_order: index
    )
  end
end

namespace :db do
  desc 'Creating sample data'
  task load_sample_data: :environment do
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
        (1..5).to_a.sample.times do
          print '.'
          Engagement.create!(
            project: project, resource: rand_array_value(resources), description: Faker::Hobbit.quote,
            quantity: rand(10), provider: rand_array_value(users_accounts), state: rand_array_value(Engagement.states)
          )
        end
      end
      puts ''
    end

    puts 'Task completed successfully!'
  end
end
