# frozen_string_literal: true

module HexletCode
  class FormTemplate
    def self.render(form_data)
      form_options = form_data[:options]
      submit = form_data[:submit]

      inputs = form_data[:inputs].flat_map do |input|
        label = HexletCode::Tag.build('label', input[:label_html]) { input[:label].capitalize }
        input_html = render_input(input)
        [label, input_html]
      end

      HexletCode::Tag.build('form', form_options) { [*inputs, render_submit(submit)].join }
    end

    def self.render_input(input)
      input_builder = "HexletCode::Inputs::#{input[:type].capitalize}Input"
      input_class = Object.const_get(input_builder)
      input_class.render(input)
    end

    def self.render_submit(submit)
      return '' unless submit

      HexletCode::Tag.build('input', submit)
    end
  end
end
