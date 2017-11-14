# frozen_string_literal: true

uri = URI.parse(ENV['REDISCLOUD_URL'] || 'localhost:6379')
Resque.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
