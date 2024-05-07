class TaskDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def taskable_desc
    taskable = object&.taskable

    return taskable.desc if taskable.respond_to? :desc
    return taskable.name if taskable.respond_to? :name
  end

  def taskable_number
    object&.taskable&.number
  end

end
