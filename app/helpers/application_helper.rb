module ApplicationHelper
  def active?(*pathroutes)
    pathroutes.each do |arg|
      case arg
      when String
        controller = arg
        actions = []
      when Hash
        controller = arg.keys.first
        actions = Array(arg[controller])
      else
        next
      end

      next unless controller_name == controller &&
        (actions.empty? || actions.include?(action_name))

      return true
    end
    false
  end

  def sidebar_item(main_icon_class, main_title, main_path, sub_items = [])
    active = active?(main_path, *sub_items.map { |item| item[:path] }, *sub_items.map { |item| item[:active] })
    content_tag(:li, class: 'sidebar-item') do
      link_content = content_tag(:a, class: "sidebar-link sidebar-collapse collapsed #{'active' if active}",
                                 data: { bs_toggle: 'collapse' }, href: "#collapse#{main_title.parameterize}", role: 'button') do
        concat(content_tag(:i, nil, class: main_icon_class))
        concat(content_tag(:span, main_title))
      end

      concat(link_content)

      unless sub_items.empty?
        collapse_content = content_tag(:div, class: "collapse collapsible sidebar-collapse-item #{'show' if active}",
                                       id: "collapse#{main_title.parameterize}") do
          ul_content = content_tag(:ul, class: 'btn-toggle-nav list-unstyled fw-normal') do
            sub_items.map do |sub_item|
              content_tag(:li, class: 'sidebar-item') do
                link_to(send("#{sub_item[:path]}_path"),
                        class: "sidebar-link link-light rounded #{'active' if active?(sub_item[:path], sub_item[:active])}") do
                  concat(content_tag(:i, nil, class: "ti ti-#{sub_item[:icon]}"))
                  concat(content_tag(:span, sub_item[:title]))
                end
              end
            end.join.html_safe
          end

          concat(ul_content)
        end

        concat(collapse_content)
      end
    end
  end

  def label_for(name, text, required)
    content_tag(:a, for: name) do
      concat(text)
      concat(content_tag(:span, ' *', class: 'text-danger')) if required
    end
  end

  def text_for(left, right, separator = '-')
    content_tag(:div) do
      concat(content_tag(:b, left))
      concat(" #{separator} ")
      concat(right)
    end
  end

  def selection(*options, **misc)
    render partial: 'shared/selection',
           locals: { form: options[0],
                     select_name: options[1],
                     options_path: options[2],
                     value: options[3],
                     text: options[4],
                     desc: options[5],
                     options: misc.to_json,
                     results: [] }
  end

  def sortable_header(text, path, column)
    order_by = params[:sort_by]
    order_dir = params[:dir]
    css_class = order_by == column.to_s ? "ti-sort-#{order_dir}" : 'ti-arrows-sort'

    link_params = { sort_by: column, dir: toggle_sort_order(order_dir, column) }

    render partial: 'shared/sortable_header',
           locals: { text:, path:, link_params:, column:, order_by:, order_dir:, css_class: }
  end

  def search_filter(_path, default_column, columns = [])
    url = get_url('search_by')
    render partial: 'shared/search_filter', locals: { url:, default_column:, columns: }
  end

  def advanced_filter(_path, param = 'filters')
    url = get_url(param)
    render partial: 'shared/advanced_filter', locals: { url: }
  end

  def user_tasks_count
    task = Task.all
    task = Task.where(user_id: current_user.id) unless current_user.is_superadmin?
    task.ongoing.count || 0
  end

  def link_access(name, path, access)
    link = {}
    link[name] = path if access

    link
  end

  private

  def toggle_sort_order(order_dir, current_column)
    if params[:sort_by] == current_column.to_s && order_dir == 'ASC'
      'DESC'
    else
      'ASC'
    end
  end

  def get_url(param_to_remove)
    uri = URI.parse(request.fullpath)
    params = URI.decode_www_form(uri.query || '')

    # Remove only the specified parameter and its value
    params.reject! { |key, _| key == param_to_remove }

    # Rebuild the URL with the base path and modified parameters
    uri.query = URI.encode_www_form(params)
    uri.to_s
  end

end
