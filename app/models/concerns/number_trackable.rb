module NumberTrackable
  extend ActiveSupport::Concern

  included do
    before_create :generate_track_number
  end

  class_methods do
    def track_number(column_name, ljust_value, fill_char, options = {})
      class_attribute :track_column_name, :ljust_value, :fill_char, :suffix_options, :suffix_default, :prefix_options, :prefix_default

      self.track_column_name = column_name.to_sym
      self.ljust_value = ljust_value
      self.fill_char = fill_char
      self.suffix_default = options.fetch(:suffix_default, '')
      self.prefix_default = options.fetch(:prefix_default, '')
      self.suffix_options = options.fetch(:suffix_options, {})
      self.prefix_options = options.fetch(:prefix_options, {})

      before_validation :generate_track_number, on: :create
    end
  end

  private

  def generate_track_number
    prefix = determine_affix(prefix_options, prefix_default, :prefix)
    suffix = determine_affix(suffix_options, suffix_default, :suffix)

    # Find the maximum number with the given prefix
    latest_number = self.class.where("#{self.class.track_column_name} LIKE ?", "#{prefix}%").maximum(self.class.track_column_name)

    # Extract the numeric part, increment it, and format it with the prefix
    next_number = if latest_number.present?
                    latest_number.gsub(prefix, '').to_i + 1
                  else
                    1
                  end

    ljust_value = self.class.ljust_value.abs
    track_number = "#{prefix}#{next_number.to_s.rjust(ljust_value, fill_char.to_s)}#{suffix}"
    self[self.class.track_column_name] = track_number
  end

  def determine_affix(options, default, type)
    key = purch_reqn_type.to_s

    if options.present?
      options[key].presence || send("#{type}_default")
    else
      send("#{type}_default")
    end
  end
end
