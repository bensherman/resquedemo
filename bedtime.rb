class Bedtime
  def sleep(t)
    puts "Bedtime: Sleeping for #{t} seconds"
    Resque.enqueue(Sleepy, t)
  end
end

class Sleepy
  @queue = :sleepy

  def self.perform(seconds)
    puts "Sleepy: Sleeping for #{seconds} seconds: "
    sleep seconds
  end
end
