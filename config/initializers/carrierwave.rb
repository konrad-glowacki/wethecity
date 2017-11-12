# frozen_string_literal: true

require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.enable_processing = false if Rails.env.test?

  config.storage = Rails.env.production? ? :fog : :file
  config.fog_public = true
  config.fog_provider = 'fog/aws'
  config.fog_directory = ENV['AWS_BUCKET_NAME']
  config.fog_use_ssl_for_aws = true

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_ACCESS_SECRET'],
    region: ENV['AWS_REGION']
  }
end
