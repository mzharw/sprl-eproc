if Rails.env.production?
  redis_host = '127.0.0.1'
  redis_port = 6379
  redis_db = 1
else
  redis_host = 'localhost'
  redis_port = 6379
  redis_db = 0
end

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis_host}:#{redis_port}/#{redis_db}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{redis_host}:#{redis_port}/#{redis_db}" }
end

Sidekiq::Cron::Job.create(
  name: 'Task Reminder',
  cron: '0 9 * * *', # everyday at 9 am
  class: 'OngoingTaskMailerWorkerJob'
)