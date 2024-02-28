module ModelTrackable
  extend ActiveSupport::Concern

  class_methods do
    def track_user(optional = false)
      belongs_to :creator, class_name: 'User', foreign_key: :created_by_id, optional: optional
      belongs_to :updater, class_name: 'User', foreign_key: :updated_by_id, optional: optional
    end

    def track_number(column_name, options = {})
      class_attribute :track_column_name, :suffix_options, :suffix_default, :prefix_options,
                      :prefix_default, :dependent, :pad_value, :pad_char, :group_column

      self.track_column_name = column_name.to_sym
      self.suffix_default = options.fetch(:suffix_default, '')
      self.prefix_default = options.fetch(:prefix_default, '')
      self.suffix_options = options.fetch(:suffix_options, {})
      self.prefix_options = options.fetch(:prefix_options, {})
      self.dependent = options.fetch(:dependent, nil)
      self.pad_value = options.fetch(:pad_value, 0)
      self.pad_char = options.fetch(:pad_char, '0')
      self.group_column = options.fetch(:group, nil)

      before_validation :generate_track_number, on: :create
    end
  end

  private

  def generate_track_number
    prefix = determine_affix(prefix_options, prefix_default, :prefix) unless prefix_options.empty?
    suffix = determine_affix(suffix_options, suffix_default, :suffix) unless suffix_options.empty?
    group_value = send(group_column) if group_column.present?

    # Find the maximum number with the given prefix or suffix and group condition
    query_conditions = []
    query_conditions << "#{self.class.track_column_name} LIKE '#{prefix}%'" if prefix.present?
    query_conditions << "#{self.class.track_column_name} LIKE '%#{suffix}'" if suffix.present?
    query_conditions << "#{self.class.track_column_name} LIKE '%#{send(dependent)}%'" if dependent.present?
    query_conditions << "#{group_column} = '#{group_value}'" if group_column.present?

    latest_number = query_conditions.empty? ? nil : self.class.where(query_conditions.join(' AND ')).maximum("CAST(SUBSTRING(#{self.class.track_column_name} FROM LENGTH('#{prefix}') + 1) AS INTEGER)")
    next_number = ((latest_number.is_a?(String) ? latest_number.to_s.gsub(prefix, '').to_i : latest_number) || 0) + 1

    pad_value = self.class.pad_value.abs
    track_number = "#{prefix}#{next_number.to_s.rjust(pad_value, pad_char.to_s)}#{suffix}"
    self[self.class.track_column_name] = track_number
  end

  def determine_affix(options, _default, type)
    key = purch_reqn_type.to_s

    if options.present? && !key.nil?
      options[key].presence || send("#{type}_default")
    else
      send("#{type}_default")
    end
  end
end
