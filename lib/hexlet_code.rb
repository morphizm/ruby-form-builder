# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_for'

module HexletCode
  class Error < StandardError; end

  def self.form_for(instance, attributes = {})
    method = attributes.fetch(:method, 'post')
    url = attributes.fetch(:url, '#')

    result = yield HexletCode::FormFor.new(instance)
    if result
      body = result.join("\n")
      "<form action=\"#{url}\" method=\"#{method}\">\n#{body}\n</form>"
    else
      "<form action=\"#{url}\" method=\"#{method}\">\n</form>"
    end
  end
end
