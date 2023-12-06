class PurchReqnDecorator < Draper::Decorator
  def self.collection_decorator_class
    PaginationDecorator
  end

  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def plant_code
    object.plant&.code
  end
end
