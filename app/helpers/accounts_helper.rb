# frozen_string_literal: true

module AccountsHelper
  def social_media_urls(account)
    result = {}
    link_keys = %w[website facebook linkedin]

    link_keys.each do |key|
      url = account.public_send(key + '_url')
      result[key] = url if url.present?
    end

    result.map { |key, url| link_to key.capitalize, url, target: '_blank' }
          .join(content_tag(:span, '|', class: 'px-2')).html_safe
  end
end
