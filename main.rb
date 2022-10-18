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
    Signal.trap("QUIT") { puts "Nap: I've been woken up!" }
    puts "#{Process.pid} Nap: Sleeping for #{seconds} seconds: "
    sleep seconds
    puts "#{Process.pid} Nap: Done sleeping."

  end
end

def add_jobs()
  Bedtime.new.sleep(60)
  Bedtime.new.sleep(60)
  Bedtime.new.sleep(30)
  Bedtime.new.sleep(30)
  Bedtime.new.sleep(10)
  Bedtime.new.sleep(10)
end
