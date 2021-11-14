# frozen_string_literal: true

require_relative 'single_tag'
require_relative 'double_tag'

module HexletCode
  class Tag
    class << self
      def build(tag_name, attributes = {}, &block)
        if single_tag?(tag_name)
          HexletCode::SingleTag.build(tag_name, attributes)
        else
          HexletCode::DoubleTag.build(tag_name, attributes, &block)
        end
      end

      def single_tag?(tag_name)
        ['br', 'img', 'input'].include?(tag_name)
      end
    end
  end
end
