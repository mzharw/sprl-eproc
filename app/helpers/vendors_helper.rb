module VendorsHelper
  def generate_links(title, **links)
    target = "collapse-#{(title.downcase).gsub(' ', '-')}"
    option = params[:option]&.to_sym
    content_tag(:div, class: 'accordion-item') do
      header = content_tag(:h2, class: 'accordion-header') do
        content_tag(:button, type: 'button', class: "accordion-button#{' collapsed' unless links.values.include? option}", data: { 'bs-toggle': 'collapse', 'bs-target': "##{target}" }) do
          title
        end
      end

      concat(header)

      list = content_tag(:div, class: "accordion-collapse collapse accordion-flush#{' show' if links.values.include? option}", id: target, data: { 'bs-parent': 'vendor-links' }) do
        content_tag(:div, class: 'list-group') do
          links.each do |k, v|
            link = link_to(k, vendor_path(option: v), class: "list-group-item list-group-flush#{' active' if option === v}", data: { 'turbo-stream': true })
            concat(link)
          end
        end
      end

      concat(list)
    end
  end

  def vendor_country(data)
    begin
      get_value(data, 'address', 'country', 'name')
    end
  end

  def vendor_province(data)
    begin
      get_value(data, 'address', 'province', 'name')
    end
  end

  def vendor_city(data)
    begin
      city = get_value(data, 'address', 'district')
      city&.[]('name') || city&.[]('code') || city
    end
  end

  def vendor_sub(data)
    begin
      get_value(data, 'address', 'sub_district', 'name')
    end
  end

  def vendor_postcode(data)
    begin
      get_value(data, 'address', 'postal_code')
    end
  end

  def vendor_address(data)
    begin
      get_value(data, 'address', 'postal_address')
    end
  end

  def vendor_phone(data)
    begin
      get_value(data, 'phone_number', 'number')
    end
  end

  def vendor_fax(data)
    begin
      get_value(data, 'fax_number', 'number')
    end
  end

  def vendor_emails(data)
    begin
      emails = get_email(data)
      emails.map { |_k, v| v }.join(', ') if emails
    end
  end

  def get_value(obj, *key)
    begin
      data = get_data(obj)

      key.each do |k|
        data = data.[](k.to_s) if data
        break if data.is_a? String
      end

      data
    end
  end

  private

  def get_data(obj)
    obj.data
  end

  def get_email(data)
    get_value(data, 'email')
  end
end
