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
    format_datetime(defined?(expected_delivery_date) ? expected_delivery_date : delivery_date)
  end

  def plant_code
    object&.plant&.code
  end

  def plant_name
    object&.plant&.facility&.name
  end

  def cost_center_code
    object&.cost_center&.cost_center_id
  end

  def cost_center_desc
    object&.cost_center&.desc
  end

  def wbsproject_code
    object&.wbsproject&.wbs_id
  end

  def wbsproject_desc
    object&.wbsproject&.desc
  end

  def purch_group_code
    object&.purch_group&.code
  end

  def purch_group_name
    object&.purch_group&.party&.full_name
  end

  def purch_org_code
    object&.purch_org&.code
  end

  def purch_org_name
    object&.purch_org&.party&.full_name
  end

  def product_group_code
    object&.product_group&.code
  end

  def product_group_name
    object&.product_group&.name
  end

  def product_code
    object&.product&.code
  end

  def product_name
    object&.product&.name
  end

  def vendor_code
    object&.vendor&.code
  end

  def vendor_name
    object&.vendor&.party&.full_name
  end

  def currency_code
    object&.currency&.code
  end

  def workflow_instance
    object&.workflow_instances&.last
  end

  def workflow_state
    step = workflow_instance&.workflow_step
    (step&.seq || 0).zero? ? '' : step&.name
  end

  def workflow_approver
    object&.workflow_instances&.pluck(:updated_by_id)&.uniq
  end

  def format_number(value, options = {})
    options = { precision: 2, delimiter: ',', separator: '.' }.merge(options)

    number = value.to_s.gsub(/[^0-9.-]/, '').to_f

    if number.nan?
      "0.00"
    else
      formatted_number = number_with_precision(number, precision: options[:precision], delimiter: options[:delimiter], separator: options[:separator])
      formatted_number
    end
  end

  def number_with_precision(number, options = {})
    options = { precision: 3, delimiter: ',', separator: '.' }.merge(options)

    parts = number.to_s.split('.')
    whole, fraction = parts[0], parts[1]

    whole = whole.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{options[:delimiter]}")
    [whole, fraction.to_s[0..(options[:precision] - 1)].ljust(options[:precision], '0')].compact.join(options[:separator])
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
