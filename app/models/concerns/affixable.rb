module Affixable
  extend ActiveSupport::Concern

  included do
    before_create :set_affixes
  end

  class_methods do
    def affix_options(options = {})
      class_attribute :prefix_options, :suffix_options
      self.prefix_options = options.fetch(:prefix, {})
      self.suffix_options = options.fetch(:suffix, {})
    end
  end

  private

  def set_affixes
    prefix = determine_prefix
    suffix = determine_suffix
    self[self.class.track_column_name] = "#{prefix}#{suffix}"
  end

  def determine_prefix
    case purch_reqn_type
    when 'SERVICE'
      prefix_options[:service] || '14'
    when 'MATERIAL'
      prefix_options[:material] || '12'
    else
      prefix_options[:default] || '00'
    end
  end

  def determine_suffix
    # Add logic to determine suffix based on some criteria, if needed
    suffix_options[:default] || ''
  end
end
