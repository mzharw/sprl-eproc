class TaskMailer < ApplicationMailer
  def ongoing_task_email(task)
    @task = task

    taskable = task.taskable

    unless taskable.nil?
      cc = [taskable.creator_email]
      users = User.with_any_role?('Super Admin', 'General Manager', 'Reminder')
                  .where(purch_group_id: taskable.purch_group_id)
      users = users.where(plant_id: taskable.plant_id) if taskable.respond_to?(:plant_id)
      cc = [cc, *users.pluck(:email)] unless users.nil?
    end

    mail(to: task.user.email, cc: -> { cc }, subject: "Task #{task.number} is still ongoing")
  end
end
