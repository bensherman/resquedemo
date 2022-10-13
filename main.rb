require 'resque'
require 'redis'

Resque.redis = Redis.new(host: "redis", port: 6379)
Redis.silence_deprecations = true

class Bedtime
  def sleep(t)
    puts "Bedtime: queueing a #{t} second nap"
    Resque.enqueue(Nap, t)
  end
end

class Nap
  @queue = :sleepy

  def self.perform(seconds)
    puts "Nap: Sleeping for #{seconds} seconds: "
    sleep seconds
  end
end

def add_jobs(n=10)
  puts "adding #{n} jobs"
  # start 10 random length jobs
  sleepers = 10
  sleepers.times do
    Bedtime.new.sleep(rand(10))
  end
end
