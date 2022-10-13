require 'resque'
require 'redis'
require './bedtime'

Resque.redis = Redis.new(host: "redis", port: 6379)
Redis.silence_deprecations = true

puts "adding a worker"
w = Resque::Worker.new(:sleepy)

puts "adding 10 jobs"
# start 10 random length jobs
sleepers = 10
sleepers.times do |i|
  Bedtime.new.sleep(rand(10))
end

puts "starting worker"
w.work