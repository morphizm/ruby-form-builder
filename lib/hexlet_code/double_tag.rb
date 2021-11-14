# frozen_string_literal: true

module HexletCode
  class DoubleTag
    class << self
      def build(tag_name, attributes)
        attrs = attributes.keys.map { |key| " #{key}=\"#{attributes[key]}\"" }.join('')
        body = block_given? ? yield : ''
        "<#{tag_name}#{attrs}>#{body}</#{tag_name}>"
      end
    end
  end
end
