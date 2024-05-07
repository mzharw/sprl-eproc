module ModelDryable
  extend ActiveSupport::Concern

  def str_parser(value)
    if value.is_a? String
      (value).gsub(',', '').to_f
    else
      value
    end
  end
end