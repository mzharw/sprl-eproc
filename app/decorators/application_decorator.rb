class ApplicationDecorator < Draper::Decorator
  # Define methods for all decorated objects.
  # Helpers are accessed through `helpers` (aka `h`). For example:
  #
  #   def percent_amount
  #     h.number_to_percentage object.amount, precision: 2
  #   end

  def self.collection_decorator_class
    PaginationDecorator
  end

  def creator_name
    object.creator&.username
  end

  def updater_name
    object.updater&.username
  end

  def formatted_create
    format_datetime(created_at)
  end

  def formatted_update
    format_datetime(updated_at)
  end

  def formatted_delivery
    format_datetime(expected_delivery_date)
  end

  private

  def format_datetime(timestamp)
    date = timestamp&.to_date
    time = timestamp&.to_time

    date_str = date&.strftime("%d %B %Y")
    time_str = time&.strftime("%I:%M %p")

    "#{date_str} #{time_str}"
  end
end
