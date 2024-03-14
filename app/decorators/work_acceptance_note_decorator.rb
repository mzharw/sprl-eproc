class WorkAcceptanceNoteDecorator < ApplicationDecorator
  delegate_all
  decorates_association :workflow_instances, scope: :passed
  decorates_association :workflow
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def submitted?
    object&.state != 'DRAFT'
  end

  def submitable?
    true
  end

  def doc_title(name)
    object.class.doc_title(name)
  end

end
