module ApplicationHelper
  def is_active?(controller, action = nil)
    'active' if controller_name == controller && (action.nil? || action_name == action)
  end

  def selection(select_name, options_path, value, text)
    render partial: 'shared/selection', locals: { select_name:, options_path:, value:, text:, results: [] }
  end
end
