# frozen_string_literal: true
require "digest/md5"
require "cgi"
require "action_view"

class RailsGravatar
  include ActionView::Helpers::TagHelper

  DEFAULT_SIZE = 64

  class << self
    def prefetch_dns_tag
      new.prefetch_dns_tag
    end

    def src(email_address, size = DEFAULT_SIZE, fallback_image_url = nil)
      new(email_address, size, fallback_image_url).src
    end

    def tag(email_address, size = DEFAULT_SIZE, fallback_image_url = nil, alt_text = nil)
      new(email_address, size, fallback_image_url, alt_text).tag
    end
  end

  def initialize(email_address = nil, size = DEFAULT_SIZE, fallback_image_url = nil, alt_text = nil)
    @email_address = email_address
    @size = size
    @fallback_image_url = fallback_image_url
    @alt_text = alt_text
  end

  def src
    [
      "//www.gravatar.com/avatar/",
      email_address_digest,
      "?",
      size_param,
      fallback_image_url_param
    ].join
  end

  def email_address_digest
    Digest::MD5.hexdigest(email_address)
  end

  def email_address
    @email_address.downcase.strip
  end

  def size_param
    "s=#{size}"
  end

  def size
    @size.clamp(1, 2048)
  end

  def fallback_image_url_param
    @fallback_image_url ? "&d=#{CGI.escape(@fallback_image_url)}" : nil
  end

  def tag
    content_tag(:img, nil, src: src, class: "gravatar", alt: @alt_text)
  end

  def prefetch_dns_tag
    content_tag(:link, nil, rel: "dns-prefetch", href: "//gravatar.com")
  end
end
