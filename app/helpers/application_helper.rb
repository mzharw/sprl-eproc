module ApplicationHelper
  def active?(controller, action = nil)
    'active' if controller_name == controller && (action.nil? || action_name == action)
  end

  def selection(form, select_name, options_path, value, text)
    render partial: 'shared/selection', locals: { form:, select_name:, options_path:, value:, text:, results: [] }
  end

  def sortable_header(text, path, column)
    order_by = params[:by]
    order_dir = params[:dir]
    css_class = order_by == column.to_s ? "ti-sort-#{order_dir}" : 'ti-arrows-sort'

    link_params = { by: column, dir: toggle_sort_order(order_dir, column) }

    render partial: 'shared/sortable_header',
           locals: { text:, path:, link_params:, column:, order_by:, order_dir:, css_class: }
  end

  private

  def toggle_sort_order(order_dir, current_column)
    if params[:by] == current_column.to_s && order_dir == 'ASC'
      'DESC'
    else
      'ASC'
    end
  end
end
