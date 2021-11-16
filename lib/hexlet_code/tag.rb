# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(tag_name, attributes = {})
        line_attrs = build_attributes(attributes)
        return "<#{tag_name}#{line_attrs}>" if single_tag?(tag_name)

        body = block_given? ? yield : ''
        "<#{tag_name}#{line_attrs}>#{body}</#{tag_name}>"
      end

      def single_tag?(tag_name)
        ['br', 'img', 'input'].include?(tag_name)
      end

      def build_attributes(attributes)
        attributes.keys.map do |key|
          " #{key}=\"#{attributes[key]}\""
        end.join
      end
    end
  end
end
