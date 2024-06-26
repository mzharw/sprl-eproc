module Taskable
  extend ActiveSupport::Concern
  attr_accessor :assignees, :task_name

  def update_task(create = true, assignee = nil)
    end_task
    create_task(assignee) if create
  end

  private

  def create_task(assignee)
    number = task_number
    assigner = assignee.nil? ? assignees : assignee
    assigner = [assigner] if assigner.is_a? User
    assigner&.each do |user|
      new_task = tasks.new
      new_task.user_id = user.id
      new_task.name = task_name
      new_task.state = 'ONGOING'
      new_task.number = number
      new_task.save
    end
  end

  def end_task
    active_tasks.update(state: 'FINISHED') if active_tasks.exists?
  end

  def task_number
    active_tasks.exists? ? active_tasks.last.number : "P04#{rand(0..9_999_999)}"
  end

  def active_tasks
    tasks.where(state: 'ONGOING')
  end
end