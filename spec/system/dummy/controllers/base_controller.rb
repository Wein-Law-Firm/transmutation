# frozen_string_literal: true

class BaseController
  def render(json: nil, body: nil, **options)
    return body if body

    JSON.parse(JSON.generate(json))
  end

  # Simulates Rails' send_data method which internally calls render
  # See: https://api.rubyonrails.org/classes/ActionController/DataStreaming.html
  #
  # Note: Rails calls render with a Hash (not keyword arguments):
  #   render options.slice(:status, :content_type).merge(body: data)
  #
  # We simulate this exactly to catch any issues with Hash vs kwargs handling
  def send_data(data, options = {})
    render(**options.slice(:status, :content_type).merge(body: data))
  end
end
