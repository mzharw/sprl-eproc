every 1.day, at: '8:00 am' do
  runner "OngoingTaskMailerWorker.perform_async"
end