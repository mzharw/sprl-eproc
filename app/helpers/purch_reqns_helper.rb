module PurchReqnsHelper
  def badge(state)
    classes = state(state, :badge)
    content_tag(:span, class: "badge #{classes}") do
      if [true, false].include? state
        if state
          concat(content_tag(:i, '', class: 'ti ti-check'))
          # concat('Yes')
        else
          concat(content_tag(:i, '', class: 'ti ti-x'))
          # concat('No')
        end
      else
        state
      end
    end
  end

  def state(state, option = nil)
    classes = {}
    classes[:badge] =
      case state
      when 'COMMITTED'
        'text-bg-light-success'
      when 'FINISHED'
        'text-bg-light-success'
      when 'ONGOING'
        'text-bg-light-warning'
      when 'DRAFT'
        'text-bg-light-secondary'
      when 'REJECTED'
        'text-bg-light-danger'
      else
        if state
          'text-success'
        else
          'text-danger'
        end
      end

    classes[option] unless option.nil?
  end
end
