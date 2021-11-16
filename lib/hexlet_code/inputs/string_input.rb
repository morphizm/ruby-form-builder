# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def self.render(options)
        default_options = {
          name: options[:label],
          type: 'text',
          value: options[:value]
        }.merge(options[:attributes])

        HexletCode::Tag.build('input', default_options)
      end
    end
  end
end
