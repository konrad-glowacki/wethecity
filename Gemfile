# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .cofffee assets and views
gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'underscore-rails'

gem 'bootstrap-sass', '~> 3.3.7'

gem 'jquery-rails'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# File uploads
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

# Amazon service library
gem 'fog-aws'

# Authentication
gem 'devise', '~> 4.3'
gem 'devise-i18n'

# OmniAuth authentication system
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'

# Panel Admin
gem 'administrate', '~> 0.8'

# Project location geocoding helper
gem 'geocoder'

# Check ancestry
gem 'ancestry'

# A Rails plugin to hide records instead of deleting them, making them recoverable later.
gem 'paranoia', '~> 2.2'

# Background jobs
gem 'resque'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-sass'
  gem 'rails-assets-jquery'
end

group :development, :test do
  # Shell for ruby
  gem 'pry'

  # Load environment variables from .env
  gem 'dotenv-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Automatically run tests
  gem 'guard'
  gem 'guard-minitest'

  # Git hook manager
  gem 'overcommit', '~> 0.41.0', require: false

  # Ruby static code analyzer
  gem 'rubocop', '~> 0.51.0', require: false

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
