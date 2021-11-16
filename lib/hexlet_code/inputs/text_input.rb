# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def self.render(options)
        default_options = {
          cols: 20,
          rows: 40,
          name: options[:label]
        }.merge(options[:attributes])

        HexletCode::Tag.build('textarea', default_options) { options[:value] }
      end
    end
  end
end
