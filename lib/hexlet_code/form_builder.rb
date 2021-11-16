# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :result

    def initialize(instance, options)
      method = options.fetch(:method, 'post')
      action = options.fetch(:url, '#')

      @instance = instance
      @result = {
        submit: nil,
        options: { action: action, method: method },
        inputs: []
      }
    end

    def input(instance_attribute, attributes = {})
      type = attributes.fetch(:as, 'string')
      value = @instance.public_send(instance_attribute)
      label_html = attributes.fetch(:label_html, {})
      input_value = {
        type: type,
        value: value,
        attributes: attributes.except(:label_html, :as),
        label: instance_attribute,
        label_html: { for: instance_attribute }.merge(label_html)
      }

      @result[:inputs] << input_value
      @result
    end

    def submit(value = 'Save')
      @result[:submit] = { name: 'commit', type: 'submit', value: value }
      @result
    end
  end
end
