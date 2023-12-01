module ApplicationHelper
  def is_active?(controller, action = nil)
    'active' if controller_name == controller && (action.nil? || action_name == action)
  end
end
