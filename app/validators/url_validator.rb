class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'Must be a valid URL') unless url_valid?(value)
  end

  # rubocop:disable Style/RescueModifier
  def url_valid?(url)
    url = URI.parse(url) rescue false
    url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
  end
  # rubocop:enable Style/RescueModifier
end
