# frozen_string_literal: true

CarrierWave.configure do |config|
  config.storage = Rails.env.production? ? :s3 : :file
  config.enable_processing = false if Rails.env.test?
end
