# frozen_string_literal: true

Resque.redis = ENV['REDISCLOUD_URL'] || 'localhost:6379'
