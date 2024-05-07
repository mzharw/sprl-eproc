class TaskMailer < ApplicationMailer
  def ongoing_task_email(task)
    @task = task

    taskable = task.taskable

    unless taskable.nil?
      users = User.with_any_role('Super Admin', 'General Manager', 'Reminder')
      to = task.user.email
      cc = users.pluck(:email) unless users.nil?
      bcc = User.with_role('Super Admin').pluck(:email)

      mail(to:, cc:, bcc:, subject: "Task #{task.number} is still ongoing")
    end

  end
end
