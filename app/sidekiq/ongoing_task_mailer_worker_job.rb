class OngoingTaskMailerWorkerJob
  include Sidekiq::Job

  def perform(*args)
    Task.ongoing.find_each do |task|
      # Send email for the ongoing task
      TaskMailer.ongoing_task_email(task).deliver_later
    end
  end
end
