# frozen_string_literal: true

module HexletCode
  class SingleTag
    class << self
      def build(tag_name, attributes)
        attrs = attributes.keys.map { |key| " #{key}=\"#{attributes[key]}\"" }.join('')
        "<#{tag_name}#{attrs}>"
      end
    end
  end
end
